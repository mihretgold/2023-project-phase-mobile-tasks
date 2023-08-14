import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTaskModel = TaskModel(id : 1, title : "Test Task", description : "This is an example task",
      dueDate : DateTime.parse("2023-08-10T12:34:56.789Z"), status : false);

  test('should be a subclass of Tasks entity', () async {
    //assert
    expect(tTaskModel, isA<Tasks>());
  });

  test('should return a valid model from the JSON', () async {
    //arrange

    final Map<String, dynamic> taskModel = json.decode(fixture('todo.json'));

    // act
    final result = TaskModel.fromJson(taskModel);

    //assert
    expect(result, isA<TaskModel>());
    expect(result.id, tTaskModel.id);
    expect(result.title, tTaskModel.title);
    expect(result.description, tTaskModel.description);
    expect(result.dueDate, tTaskModel.dueDate);
    expect(result.status, tTaskModel.status);
  });

  test('should return a JSON map containing the proper data', () async {
    // act
    final result = tTaskModel.toJson();

    //assert
    final expectedMap = {
      "id": 1,
      "title": "Test Task",
      "description": 'This is an example task',
      "dueDate": DateTime.parse('2023-08-10T12:34:56.789Z'),
      "status": false,
    };
    expect(result, expectedMap);
  });
}
