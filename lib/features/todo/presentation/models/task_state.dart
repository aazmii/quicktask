import 'package:equatable/equatable.dart';
import '../../domain/entities/task.dart';

class TaskState extends Equatable {
  final bool isLoading;
  final List<Task> tasks;
  final String? error;

  const TaskState({
    required this.isLoading,
    required this.tasks,
    this.error,
  });

  factory TaskState.initial() {
    return const TaskState(isLoading: false, tasks: []);
  }

  TaskState copyWith({
    bool? isLoading,
    List<Task>? tasks,
    String? error,
  }) {
    return TaskState(
      isLoading: isLoading ?? this.isLoading,
      tasks: tasks ?? this.tasks,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, tasks, error];
}
