import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/core/error/failures.dart';
import 'package:todo_mobile_app/core/usecases/usecases.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';

class ViewAllTask implements UseCase<List<Tasks>, NoParams> {
  final TaskRepository repository;

  ViewAllTask(this.repository);

  @override
  Future<Either<Failure, List<Tasks>>?> call(NoParams params) async {
   return await repository.viewAllTasks();
  }
}


