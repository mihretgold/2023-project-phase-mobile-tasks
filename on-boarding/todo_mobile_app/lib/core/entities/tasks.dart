import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';

class Tasks {
  final int id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool status;

  const Tasks(
      {required this.id,
      required this.title,
      required this.description,
      required this.dueDate,
      required this.status});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tasks &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          dueDate == other.dueDate &&
          status == other.status;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      dueDate.hashCode ^
      status.hashCode;

  TaskModel toModel() => TaskModel(
      id: id,
      title: title,
      description: description,
      dueDate: dueDate,
      status: status);
}
