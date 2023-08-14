import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/core/network/network_info.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_local_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_remote_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';
import 'package:todo_mobile_app/features/todo_list/data/repositories/task_repositorisImpl.dart';

class MockRemoteDataSource extends Mock implements TaskRemoteDataSource {}

class MockLocalDataSource extends Mock implements TaskLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([NetworkInfo])
@GenerateMocks([TaskRemoteDataSource])
void main() {
  late TaskRepositorisImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(
    () {
      mockRemoteDataSource = MockRemoteDataSource();
      mockLocalDataSource = MockLocalDataSource();
      mockNetworkInfo = MockNetworkInfo();

      repository = TaskRepositorisImpl(
          remoteDataSource: mockRemoteDataSource,
          localDataSource: mockLocalDataSource,
          networkInfo: mockNetworkInfo);
    },
  );

  const int id = 1;
  final tTaskModel = TaskModel(
      id: 1,
      title: 'title',
      description: 'description',
      dueDate: DateTime.now(),
      status: false);
  final tTask = Tasks(
      id: 1,
      title: 'title',
      description: 'description',
      dueDate: DateTime.now(),
      status: false);

  test('should check if the device is online', () async {
    // assuming we get the id from a remote source for practicing purposes

    // arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

    // act
    repository.searchTask(id);

    // assert
    verify(mockNetworkInfo.isConnected);
  });

  test(
      'should return remote data when the call to remote data source is successfull',
      () async {
    // arrange

    when(mockRemoteDataSource.searchTask(id))
        .thenAnswer((_) async => tTaskModel);

    // act
    final result = await repository.searchTask(id);

    // assert

    expect(result, equals(Right(tTask.toModel())));
    verify(mockRemoteDataSource.searchTask(id));
    verifyNoMoreInteractions(mockRemoteDataSource);
  });
}
