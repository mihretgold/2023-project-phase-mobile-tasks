import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/core/error/failures.dart';
import 'package:todo_mobile_app/core/usecases/usecases.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';

class ViewSpecificTask implements UseCase<Tasks, Params> {
  final TaskRepository repository;

  ViewSpecificTask(this.repository);

  @override
  Future<Either<Failure, Tasks>?> call(Params params) async {
    try {
      final task = await repository.searchTask(params.id);
      return task;
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to retrieve task', type: e.runtimeType));
    }
  }
}

class Params {
  final int id;
  const Params(this.id);
}

