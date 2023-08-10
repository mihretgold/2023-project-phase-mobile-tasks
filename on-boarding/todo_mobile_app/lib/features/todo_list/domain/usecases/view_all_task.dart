import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/core/error/failures.dart';
import 'package:todo_mobile_app/core/usecases/usecases.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';

class ViewAllTask implements UseCase<List<Tasks>, NoParams> {
  final TaskRepository repository;

  ViewAllTask(this.repository);

  @override
  Future<Either<Failure, List<Tasks>>> call(NoParams params) async {
    try {
      final tasks = await repository.viewAllTasks();
      return tasks;
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to retrieve tasks', type: e.runtimeType));
    }
  }
}

class NoParams {}
