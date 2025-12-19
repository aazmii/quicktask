import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quicktask/features/todo/domain/entities/task.dart' show Task;
import 'package:quicktask/features/todo/presentation/provider/task_provider.dart';
import 'package:uuid/uuid.dart';

import 'task.tile.dart';

class TaskListPage extends ConsumerStatefulWidget {
  const TaskListPage({super.key});

  @override
  ConsumerState<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends ConsumerState<TaskListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(taskPProvider.notifier).loadTasks());
  }

  DateTime? reminder;

  Future<void> _openTaskDialog({Task? task}) async {
    final titleCtrl = TextEditingController(text: task?.title ?? "");
    final descCtrl = TextEditingController(text: task?.description ?? "");

    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(task == null ? "Add Task" : "Edit Task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: const Text("Set Reminder"),
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  initialDate: task?.reminderTime ?? DateTime.now(),
                );

                if (date == null) return;

                final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (time == null) return;

                reminder = DateTime(date.year, date.month, date.day, time.hour, time.minute);
              },
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text("Save")),
        ],
      ),
    );

    if (result != true || titleCtrl.text.trim().isEmpty) return;

    final notifier = ref.read(taskPProvider.notifier);

    final newTask = task == null
        ? Task(
            id: const Uuid().v4(),
            title: titleCtrl.text.trim(),
            description: descCtrl.text.trim(),
            isCompleted: false,
            createdAt: DateTime.now(),
            reminderTime: reminder,
          )
        : task.copyWith(title: titleCtrl.text.trim(), description: descCtrl.text.trim(), reminderTime: reminder);

    task == null ? notifier.add(newTask) : notifier.update(newTask);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(taskPProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Todo")),
      floatingActionButton: FloatingActionButton(onPressed: () => _openTaskDialog(), child: const Icon(Icons.add)),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.tasks.isEmpty
          ? const Center(child: Text("No tasks yet"))
          : ListView.separated(
              itemCount: state.tasks.length,
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemBuilder: (_, i) {
                final task = state.tasks[i];
                return TaskTile(
                  task: task,
                  onToggle: () => ref.read(taskPProvider.notifier).toggle(task.id),
                  onEdit: () => _openTaskDialog(task: task),
                  onDelete: () => ref.read(taskPProvider.notifier).remove(task.id),
                );
              },
            ),
    );
  }
}
