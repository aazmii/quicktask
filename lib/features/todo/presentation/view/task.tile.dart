import 'package:flutter/material.dart';
import 'package:quicktask/core/extensions/extension.dart';
import 'package:quicktask/features/todo/domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 120,
      
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 12, color: Colors.green),
              Expanded(
                child: Container(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title,
                                style: TextStyle(
                                  decoration: task.isCompleted
                                      ? TextDecoration.lineThrough
                                      : null,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              if (task.description != null &&
                                  task.description!.isNotEmpty)
                                Text(
                                  task.description!,
                                  style: TextStyle(
                                    decoration: task.isCompleted
                                        ? TextDecoration.lineThrough
                                        : null,
                                  ),
                                ),
                              if (task.reminderTime != null) ...[
                                SizedBox(height: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.alarm, size: 16),
                                    SizedBox(width: 4),
                                    Text(task.reminderTime?.formattedTime ?? ''),
                                    SizedBox(width: 4),
                                    CircleAvatar(
                                      radius: 2,
                                      backgroundColor: Colors.grey,
                                    ),
                                    SizedBox(width: 4),
                                    Text(task.reminderTime?.formattedDate ?? ''),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'done') {
                              onToggle();
                            } else if (value == 'remove') {
                              onDelete();
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: 'done',
                              child: Text(task.isCompleted ? 'Uncheck' : 'Check'),
                            ),
                            PopupMenuItem(value: 'remove', child: Text('Remove')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
