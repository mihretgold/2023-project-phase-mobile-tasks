import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class TaskFailure extends Failure {
  const TaskFailure({required this.message, required this.type});
  final String message;
  final Type type;

  @override
  List<Object?> get props => [message, type];

  @override
  bool get stringify => true;
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
