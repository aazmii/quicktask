import 'package:quicktask/features/todo/domain/usecases/add_task.dart';
import 'package:quicktask/features/todo/domain/usecases/delete_task.dart';
import 'package:quicktask/features/todo/domain/usecases/get_taskts.dart';
import 'package:quicktask/features/todo/domain/usecases/toggle_task.dart';
import 'package:quicktask/features/todo/domain/usecases/update_task.dart';
import 'package:quicktask/features/todo/presentation/models/task_state.dart';
import 'package:quicktask/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/task.dart';

part 'task_provider.g.dart';

@riverpod
class TaskP extends _$TaskP {
  late final GetTasks _getTasks;
  late final AddTask _addTask;
  late final UpdateTask _updateTask;
  late final DeleteTask _deleteTask;
  late final ToggleTask _toggleTask;
  @override
  TaskState build() {
    _getTasks = sl<GetTasks>();
    _addTask = sl<AddTask>();
    _updateTask = sl<UpdateTask>();
    _deleteTask = sl<DeleteTask>();
    _toggleTask = sl<ToggleTask>();

    return TaskState.initial();
  }

  Future<void> loadTasks() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final tasks = await _getTasks(NoParams());
      state = state.copyWith(isLoading: false, tasks: tasks);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> add(Task task) async {
    await _addTask(task);
    await loadTasks();
  }

  Future<void> update(Task task) async {
    await _updateTask(task);
    await loadTasks();
  }

  Future<void> remove(String id) async {
    await _deleteTask(id);
    await loadTasks();
  }

  Future<void> toggle(String id) async {
    await _toggleTask(id);
    await loadTasks();
  }
}
