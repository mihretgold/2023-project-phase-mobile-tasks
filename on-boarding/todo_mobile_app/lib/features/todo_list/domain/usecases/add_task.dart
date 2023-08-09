import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/core/error/failures.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<Either<Failure, Unit>> execute({required Tasks task}) async {
    await repository.addTask(task);
    return const Right(unit);
  }
}
