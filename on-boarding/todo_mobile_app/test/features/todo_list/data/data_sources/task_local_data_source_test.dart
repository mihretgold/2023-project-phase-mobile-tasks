import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_mobile_app/core/error/exceptions.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_local_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'task_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences], customMocks: [ MockSpec<SharedPreferences>(as: #MockSharedPreferencesForTest,),])

void main(){
  late TaskLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = TaskLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getLastTask', () { 
    final tTaskModel = TaskModel.fromJson(json.decode(fixture('todo_cached.json')));

    test('should return Tasks from SharedPreferences when there is one in the cache', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(fixture('todo_cached.json'));

      // act
      final result = await dataSource.getLastTask();
    
      // assert
      verify(mockSharedPreferences.getString(CACHED_TASK));
      expect(result, equals(tTaskModel));


    });
    test('should throw a CacheException when there is not a chached value', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // act
      final call = dataSource.getLastTask;
    
      // assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));


    });

  });

  group('cacheTask', () { 
    final tTaskModel = TaskModel(id: 1, title: 'title', description: 'description', dueDate: DateTime.parse("2023-08-10T12:34:56.789Z"), status: false);

    test('should call SharedPreferences to cache the data', () async {
      
      // arrange

      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) => Future.value(true));
      // act
      await dataSource.cacheTask(tTaskModel);

      // assert
      final expectedJsonString = json.encode(tTaskModel.toJson());
      verify(mockSharedPreferences.setString(CACHED_TASK, expectedJsonString,));


    });

  });

}