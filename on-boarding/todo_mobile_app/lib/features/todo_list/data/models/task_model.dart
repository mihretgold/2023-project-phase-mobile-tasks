import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';

class TaskModel extends Tasks {
  const TaskModel(
      {required int id,
      required String title,
      required String description,
      required DateTime dueDate,
      required bool status})
      : super(
            id: id,
            title: title,
            description: description,
            dueDate: dueDate,
            status: status);

  // @override
  // List<Object?> get props => [id, title, description, dueDate, status];

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        dueDate: DateTime.parse(json['dueDate']),
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'status': status
    };
  }

  Tasks toEntity() => Tasks(
      id: id,
      title: title,
      description: description,
      dueDate: dueDate,
      status: status);
}
