import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime createdAt;

  const Task({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    required this.createdAt,
  });

  Task copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [id, title, description, isCompleted, createdAt];
}
