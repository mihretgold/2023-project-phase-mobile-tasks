
part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class GetTaskByIdEvent extends TaskEvent{
  final int id;
 

  const GetTaskByIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class AddTaskEvent extends TaskEvent{

  final String id;
  final String title;
  final String description;
  final String dueDate;
  final bool status;

  const AddTaskEvent({required this.id, required this.title, required this.description, required this.dueDate, required this.status});
  
  @override
  List<Object?> get props => [id, title, description, dueDate, status];
}

class GetAllFromTask extends TaskEvent{}

class GetCompletedFromTask extends TaskEvent{}

class GetPendingFromTask extends TaskEvent{}

class EditTaskEvent extends TaskEvent{
  final String id;
  final String title;
  final String description;
  final String dueDate;
  final bool status;

  const EditTaskEvent({required this.id, required this.title, required this.description, required this.dueDate, required this.status});
  
  @override
  List<Object?> get props => [id, title, description, dueDate, status];
}

class DeleteTaskEvent extends TaskEvent{
  final String id;

  const DeleteTaskEvent(this.id);

  @override

  List<Object?> get props => [id];

}