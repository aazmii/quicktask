import 'package:flutter/material.dart';
import 'package:quicktask/features/todo/domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskTile({super.key, required this.task, required this.onToggle, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: task.isCompleted, onChanged: (_) => onToggle()),
      title: Text(task.title, style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
      subtitle: (task.description == null || task.description!.isEmpty) ? null : Text(task.description!),
      trailing: Wrap(
        spacing: 8,
        children: [
          IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),
          IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
        ],
      ),
    );
  }
}
