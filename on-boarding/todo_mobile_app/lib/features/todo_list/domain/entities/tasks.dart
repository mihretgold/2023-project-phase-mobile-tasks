/*
  Task class
 */

import 'package:equatable/equatable.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';

class Tasks extends Equatable {
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
  List<Object?> get props => [id, title, description, dueDate, status];

  TaskModel toModel() => TaskModel(
      id: id,
      title: title,
      description: description,
      dueDate: dueDate,
      status: status);
}
