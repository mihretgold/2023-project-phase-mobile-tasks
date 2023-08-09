import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final Type type;

  const Failure({required this.message, required this.type});

  @override
  List<Object?> get props => [message, type];

  @override
  bool get stringify => true;
}

class TaskFailure extends Failure {
  const TaskFailure({required String message, required Type type})
      : super(message: message, type: type);
}
