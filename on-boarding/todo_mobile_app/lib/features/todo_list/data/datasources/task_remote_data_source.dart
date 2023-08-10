import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';


abstract class TaskRemoteDataSource {
  Future<Unit>? addTask(Tasks task);

  Future<List<Tasks>>? viewAllTasks();

  Future<List<Tasks>>? viewCompletedTasks();

  Future< List<Tasks>>? viewPendingTasks();

  Future<Tasks>? searchTask(int id);

  Future<Unit>? editTask(Tasks task, String title,
      String description, DateTime dueDate, bool status);

  Future<Unit>? delete(Tasks task);
  Future< Unit>? markComplete(Tasks task);
}