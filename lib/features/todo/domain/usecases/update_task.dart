import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository repo;
  UpdateTask(this.repo);

  Future<void> call(Task task) {
    return repo.updateTask(task);
  }
}
