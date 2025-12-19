import '../entities/task.dart';
import '../repositories/task_repository.dart';

class AddTask {
  final TaskRepository repo;
  AddTask(this.repo);
  Future<void> call(Task task) => repo.addTask(task);
}
