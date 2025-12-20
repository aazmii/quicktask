import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quicktask/features/todo/presentation/provider/task_provider.dart';
import 'package:quicktask/features/todo/presentation/view/task.detail.dialog.dart';
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(taskPProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Todo")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openTaskDialog(context, ref),
        child: const Icon(Icons.add),
      ),
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
                  onToggle: () =>
                      ref.read(taskPProvider.notifier).toggle(task.id),
                  onEdit: () => openTaskDialog(context, ref, task: task),
                  onDelete: () =>
                      ref.read(taskPProvider.notifier).remove(task.id),
                );
              },
            ),
    );
  }
}
