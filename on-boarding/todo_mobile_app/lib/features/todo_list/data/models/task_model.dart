import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';

class TaskModel extends Tasks {
  TaskModel(String title, String description, DateTime dueDate, bool status)
      : super(title, description, dueDate, status);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(json['title'], json['description'],
        DateTime.parse(json['dueDate']), json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'status': status
    };
  }
}
