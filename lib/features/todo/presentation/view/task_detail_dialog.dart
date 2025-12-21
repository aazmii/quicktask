import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quicktask/core/notifications/notification_service.dart';
import 'package:quicktask/features/todo/domain/entities/task.dart';
import 'package:quicktask/features/todo/presentation/provider/task_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:timezone/timezone.dart' as tz;

Future<void> openTaskDialog(
  BuildContext context,
  WidgetRef ref, {
  Task? task,
}) async {
  // await NotificationService.plugin.show(
  //   999,
  //   'Immediate Test',
  //   'If you see this, notifications work',
  //   const NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       'test_channel',
  //       'Test Channel',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //     ),
  //   ),
  // );
  // try {
  //   // Request permission (important!)
  //   await NotificationService.plugin
  //       .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin
  //       >()
  //       ?.requestExactAlarmsPermission();

  //   print("Scheduling notification...");
  //   await NotificationService.scheduleTaskReminder(
  //     id: 1,
  //     title: 'Task Reminder',
  //     body: 'This WILL work',
  //     scheduledTime: DateTime.now().add(const Duration(seconds: 5)),
  //   );
  //   print("Notification scheduled.");
  // } catch (e) {
  //   print("Notification Error: $e");
  // }

  // return;
  final titleCtrl = TextEditingController(text: task?.title ?? "");
  final descCtrl = TextEditingController(text: task?.description ?? "");

  final reminderResult = await showDialog<DateTime?>(
    context: context,
    builder: (_) =>
        TaskDialogBody(task: task, titleCtrl: titleCtrl, descCtrl: descCtrl),
  );

  if (titleCtrl.text.trim().isEmpty) return;

  final notifier = ref.read(taskPProvider.notifier);

  final newTask = task == null
      ? Task(
          id: const Uuid().v4(),
          title: titleCtrl.text.trim(),
          description: descCtrl.text.trim(),
          isCompleted: false,
          createdAt: DateTime.now(),
          reminderTime: reminderResult ?? task?.reminderTime,
        )
      : task.copyWith(
          title: titleCtrl.text.trim(),
          description: descCtrl.text.trim(),
          reminderTime: reminderResult ?? task.reminderTime,
        );

  task == null ? notifier.add(newTask) : notifier.update(newTask);
}

class TaskDialogBody extends StatefulWidget {
  final Task? task;
  final TextEditingController titleCtrl;
  final TextEditingController descCtrl;
  const TaskDialogBody({
    super.key,
    this.task,
    required this.titleCtrl,
    required this.descCtrl,
  });

  @override
  State<TaskDialogBody> createState() => _TaskDialogBodyState();
}

class _TaskDialogBodyState extends State<TaskDialogBody> {
  DateTime? reminder;

  @override
  initState() {
    super.initState();
    reminder = widget.task?.reminderTime;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task == null ? "Add Task" : "Edit Task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: widget.titleCtrl,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: widget.descCtrl,
            decoration: const InputDecoration(labelText: "Description"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            child: Text(
              reminder != null ? reminder.toString() : "Set Reminder",
            ),
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                initialDate: widget.task?.reminderTime ?? DateTime.now(),
              );

              if (date == null) return;

              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (time == null) return;
              setState(() {
                reminder = DateTime(
                  date.year,
                  date.month,
                  date.day,
                  time.hour,
                  time.minute,
                );
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: const Text("Cancel"),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, reminder),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
