import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';
import '../../../../core/error/failures.dart';
import '../entities/tasks.dart';

class TaskRepositorisImpl implements TaskRepository {
  static List<Tasks> tasks = [];

  // In functional programming, unit is a type that represents a valueless result or a "dummy" value. This to avoid returning null because null and void are not the same in dart
  @override
  Future<Either<Failure, Unit>> addTask(Tasks task) async {
    try {
      tasks.add(task);
      return const Right(unit);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to add task', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, List<Tasks>>> viewAllTasks() async {
    try {
      return Right(tasks);
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to view all tasks', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, List<Tasks>>> viewCompletedTasks() async {
    try {
      final completedTasks = tasks.where((task) => task.status).toList();
      return Right(completedTasks);
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to view completed tasks', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, List<Tasks>>> viewPendingTasks() async {
    try {
      final pendingTasks = tasks.where((task) => !task.status).toList();
      return Right(pendingTasks);
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to view pending tasks', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, Tasks>> searchTask(int taskId) async {
    try {
      final task = tasks.firstWhere((task) => task.id == taskId);
      return Right(task);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to search task', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, Unit>> editTask(
    Tasks task,
    String title,
    String description,
    DateTime dueDate,
    bool status,
  ) async {
    try {
      task.title = title;
      task.description = description;
      task.dueDate = dueDate;
      task.status = status;
      return const Right(unit);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to edit task', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(Tasks task) async {
    try {
      tasks.remove(task);
      return const Right(unit);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to delete task', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, Unit>> markComplete(Tasks task) async {
    try {
      task.markCompleted();
      return const Right(unit);
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to mark task as completed', type: e.runtimeType));
    }
  }
}
