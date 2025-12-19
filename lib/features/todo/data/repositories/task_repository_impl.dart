import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_datasource.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource local;
  TaskRepositoryImpl(this.local);

  @override
  Future<void> addTask(Task task) => local.addTask(TaskModel.fromEntity(task));

  @override
  Future<void> deleteTask(String id) => local.deleteTask(id);

  @override
  Future<List<Task>> getTasks() async {
    final models = await local.getTasks();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> toggleTask(String id) => local.toggleTask(id);

  @override
  Future<void> updateTask(Task task) => local.updateTask(TaskModel.fromEntity(task));
}
