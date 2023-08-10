import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/core/platform/network_info.dart';
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
  Future<Either<Failure, Unit>>? addTask(Tasks task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>>? delete(Tasks task) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>>? editTask(Tasks task, String title,
      String description, DateTime dueDate, bool status) {
    // TODO: implement editTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>>? markComplete(Tasks task) {
    // TODO: implement markComplete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tasks>>? searchTask(int id) {
    // TODO: implement searchTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tasks>>>? viewAllTasks() {
    // TODO: implement viewAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tasks>>>? viewCompletedTasks() {
    // TODO: implement viewCompletedTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tasks>>>? viewPendingTasks() {
    // TODO: implement viewPendingTasks
    throw UnimplementedError();
  }
}
 