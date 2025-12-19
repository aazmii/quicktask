import 'package:hive/hive.dart';
import '../../domain/entities/task.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    required this.createdAt,
  });

  factory TaskModel.fromEntity(Task t) => TaskModel(
    id: t.id,
    title: t.title,
    description: t.description,
    isCompleted: t.isCompleted,
    createdAt: t.createdAt,
  );

  Task toEntity() =>
      Task(id: id, title: title, description: description, isCompleted: isCompleted, createdAt: createdAt);
}
