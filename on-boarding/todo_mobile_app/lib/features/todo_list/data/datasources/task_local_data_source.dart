import 'package:todo_mobile_app/core/error/exceptions.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class TaskLocalDataSource {
  Future<Tasks>? getLastTask();
  Future<void>? cacheTask(TaskModel task);
}

const CACHED_TASK = 'CACHED_TASK';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Tasks>? getLastTask() {
    final jsonString = sharedPreferences.getString(CACHED_TASK);

    if (jsonString != null) {
      return Future.value(TaskModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheTask(TaskModel task) {
    sharedPreferences.setString(CACHED_TASK, json.encode(task.toJson()));
  }
}
