import 'package:hive/hive.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String id);
  Future<void> toggleTask(String id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskModel> box;
  TaskLocalDataSourceImpl(this.box);

  @override
  Future<List<TaskModel>> getTasks() async {
    final items = box.values.toList();
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items;
  }

  @override
  Future<void> addTask(TaskModel task) async {
    await box.put(task.id, task);
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    await box.put(task.id, task);
  }

  @override
  Future<void> deleteTask(String id) async {
    await box.delete(id);
  }

  @override
  Future<void> toggleTask(String id) async {
    final task = box.get(id);
    if (task == null) return;
    task.isCompleted = !task.isCompleted;
    await task.save();
  }
}
