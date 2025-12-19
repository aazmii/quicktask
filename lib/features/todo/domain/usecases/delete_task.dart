import 'package:quicktask/features/todo/domain/repositories/task_repository.dart';

class DeleteTask {
  final TaskRepository repo;
  DeleteTask(this.repo);

  Future<void> call(String taskId) {
    return repo.deleteTask(taskId);
  }
}
