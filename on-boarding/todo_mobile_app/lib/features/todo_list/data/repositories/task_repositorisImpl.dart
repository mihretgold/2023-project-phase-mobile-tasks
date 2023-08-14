import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/core/network/network_info.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_local_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_remote_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';
import '../../../../core/error/failures.dart';

class TaskRepositorisImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  TaskRepositorisImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addTask(Tasks task) async {
    try {
      await remoteDataSource.addTask(task.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to add task', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, List<Tasks>>>? viewAllTasks() async {
    try {
      final tasks = await remoteDataSource.viewAllTasks();
      return Right(tasks);
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to view all tasks', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, List<Tasks>>> viewCompletedTasks() async {
    try {
      final completedTasks = await remoteDataSource.viewCompletedTasks();
      return Right(completedTasks);
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to view completed tasks', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, List<Tasks>>> viewPendingTasks() async {
    try {
      final pendingTasks = await remoteDataSource.viewPendingTasks();
      return Right(pendingTasks);
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to view pending tasks', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, Tasks>>? searchTask(int taskId) async {
    networkInfo.isConnected;
    try {
      final task = await remoteDataSource.searchTask(taskId);
      return Right(task!);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to search task', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, Unit>> editTask(Tasks task) async {
    try {
      await remoteDataSource.editTask(task.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to edit task', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(Tasks task) async {
    try {
      await remoteDataSource.delete(task.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to delete task', type: e.runtimeType));
    }
  }

  @override
  Future<Either<Failure, Unit>> markComplete(Tasks task) async {
    try {
      await remoteDataSource.delete(task.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(TaskFailure(
          message: 'Failed to mark task as completed', type: e.runtimeType));
    }
  }
}
