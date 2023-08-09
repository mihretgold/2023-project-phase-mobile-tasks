import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/tasks.dart';

abstract class TaskRepository {
  Future<Either<Failure, Unit>> addTask(Tasks task);

  Future<Either<Failure, List<Tasks>>> viewAllTasks();

  Future<Either<Failure, List<Tasks>>> viewCompletedTasks();

  Future<Either<Failure, List<Tasks>>> viewPendingTasks();

  Future<Either<Failure, Tasks>> searchTask(int id);

  Future<Either<Failure, Unit>> editTask(Tasks task, String title,
      String description, DateTime dueDate, bool status);

  Future<Either<Failure, Unit>> delete(Tasks task);
  Future<Either<Failure, Unit>> markComplete(Tasks task);
}
