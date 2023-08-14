import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/core/fixtures/fixture_reader.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';


abstract class TaskRemoteDataSource {
  Future<Unit> addTask(TaskModel task);

  Future<List<TaskModel>> viewAllTasks();

  Future<List<TaskModel>> viewCompletedTasks();

  Future<List<TaskModel>> viewPendingTasks();

  Future<TaskModel>? searchTask(int id);

  Future<Unit> editTask(TaskModel task);

  Future<Unit> delete(TaskModel task);
  Future<Unit> markComplete(TaskModel task);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource{
  
  String jsonFilePath = fixture('todo.json');

  @override
  Future<Unit> addTask(TaskModel task) async{
    final jsonData = json.decode(jsonFilePath);
    final List<dynamic> tasksList = jsonData is List ? jsonData : [];

    tasksList.add(task.toJson());
    final updatedJsonString = json.encode(tasksList);

    fixtureWrite('todo.json', updatedJsonString);
    return unit;

  }

  @override
  Future<Unit> delete(TaskModel task) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Unit> editTask(TaskModel task) {
    // TODO: implement editTask
    throw UnimplementedError();
  }

  @override
  Future<Unit> markComplete(Tasks task) {
    // TODO: implement markComplete
    throw UnimplementedError();
  }

  @override
  Future<TaskModel>? searchTask(int id) {
    // TODO: implement searchTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> viewAllTasks() {
    // TODO: implement viewAllTasks
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> viewCompletedTasks() {
    // TODO: implement viewCompletedTasks
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> viewPendingTasks() {
    // TODO: implement viewPendingTasks
    throw UnimplementedError();
  }

}
