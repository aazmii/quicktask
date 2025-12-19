import '../repositories/task_repository.dart';

class ToggleTask {
  final TaskRepository repo;
  ToggleTask(this.repo);

  Future<void> call(String id) {
    return repo.toggleTask(id);
  }
}
