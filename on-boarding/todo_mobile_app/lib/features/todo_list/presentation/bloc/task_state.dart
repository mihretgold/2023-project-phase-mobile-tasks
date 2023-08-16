part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();
  
  @override
  List<Object> get props => [];
}

class TaskEmpty extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final Tasks task;

  const TaskLoaded({required this.task});

  @override
  List<Object> get props => [task];
}

class TaskAllLoaded extends TaskState {
  final List<Tasks> tasks;

  const TaskAllLoaded({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

class AddState extends TaskState{
  final List<Tasks> tasks;

  const AddState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class EditState extends TaskState{
  final List<Tasks> tasks;

  const EditState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class DeleteState extends TaskState{
  final List<Tasks> tasks;

  const DeleteState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class Error extends TaskState{
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
