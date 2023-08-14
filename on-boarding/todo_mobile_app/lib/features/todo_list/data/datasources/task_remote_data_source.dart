import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/core/fixtures/fixture_reader.dart';
import 'dart:convert';
import 'dart:async';


abstract class TaskRemoteDataSource {
  Future<Unit> addTask(TaskModel task);

  Future<List<TaskModel>> viewAllTasks();

  Future<List<TaskModel>> viewCompletedTasks();

  Future<List<TaskModel>> viewPendingTasks();

  Future<TaskModel?>? searchTask(int id);

  Future<Unit> editTask(TaskModel task);

  Future<Unit> delete(TaskModel task);
  Future<Unit> markComplete(TaskModel task);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource{
  
  // String jsonFilePath = await fixture('todo.json');

  @override
  Future<Unit> addTask(TaskModel task) async{
    String jsonFilePath = await fixture('todo.json');
    final jsonData = json.decode(jsonFilePath);
    final List<dynamic> tasksList = jsonData is List ? jsonData : [];

    tasksList.add(task.toJson());
    final updatedJsonString = json.encode(tasksList);

    fixtureWrite('todo.json', updatedJsonString);
    return unit;

  }

  @override
  Future<Unit> delete(TaskModel task) async{
    String jsonFilePath = await fixture('todo.json');
    final jsonData = json.decode(jsonFilePath);
    final List<dynamic> tasksList = jsonData is List ? jsonData : [];

    tasksList.removeWhere((item) => item['id'] == task.id);
    final updatedJsonString = json.encode(tasksList);

    fixtureWrite('todo.json', updatedJsonString);
    return unit;
  }

  @override
  Future<Unit> editTask(TaskModel task) async {
    String jsonFilePath = await fixture('todo.json');
    final jsonData = json.decode(jsonFilePath);
    final List<dynamic> tasksList = jsonData is List ? jsonData : [];

    final index = tasksList.indexWhere((item) => item['id'] == task.id);
    if(index != -1){
      tasksList[index] = task.toJson();
    }
    final updatedJsonString = json.encode(tasksList);

    fixtureWrite('todo.json', updatedJsonString);
    return unit;
  }

  @override
  Future<Unit> markComplete(Tasks task) {
    // TODO: implement markComplete
    throw UnimplementedError();
  }

  @override
  Future<TaskModel?>? searchTask(int id) async{
     String jsonFilePath = await fixture('todo.json');
    final jsonData = json.decode(jsonFilePath);
    final List<dynamic> tasksList = jsonData is List ? jsonData : [];

    final taskJson = tasksList.firstWhere((item) => item['id'] == id, orElse: () => null);

    var taskModel = await taskJson != null ? TaskModel.fromJson(taskJson) : null;
    return taskModel;
  }

  @override
  Future<List<TaskModel>> viewAllTasks() async{
    String jsonFilePath = await fixture('todo.json');
    final jsonData = json.decode(jsonFilePath);
    
    if(jsonData is List){
      final tasks = jsonData.map((taskJson) => TaskModel.fromJson(taskJson)).toList();
      return tasks;
    }
    else{
      throw Exception("Invalid JSON format");
    }
  }

  @override
  Future<List<TaskModel>> viewCompletedTasks() async {
    String jsonFilePath = await fixture('todo.json');
    final jsonData = json.decode(jsonFilePath);

    if (jsonData is List) {
      final tasks =
          jsonData.map((taskJson) => TaskModel.fromJson(taskJson)).where((task) => task.status).toList();
      return tasks;
    } else {
      throw Exception("Invalid JSON format");
    }
  }

  @override
  Future<List<TaskModel>> viewPendingTasks() async {
    String jsonFilePath = await fixture('todo.json');
   final jsonData = json.decode(jsonFilePath);

    if (jsonData is List) {
      final tasks =
          jsonData.map((taskJson) => TaskModel.fromJson(taskJson)).where((task) => !task.status).toList();
      return tasks;
    } else {
      throw Exception("Invalid JSON format");
    }
  }

}
