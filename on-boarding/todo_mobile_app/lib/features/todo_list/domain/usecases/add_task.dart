import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/core/error/failures.dart';
import 'package:todo_mobile_app/core/usecases/usecases.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';

class AddTask implements UseCase<Unit, Params> {
  final TaskRepository repository;

  AddTask(this.repository);

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    try {
      await repository.addTask(params.task);
      return const Right(unit);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to retrieve task', type: e.runtimeType));
    }
  }
}

class Params {
  final Tasks task;
  const Params(this.task);
}
