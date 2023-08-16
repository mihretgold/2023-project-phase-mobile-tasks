import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_mobile_app/core/error/exceptions.dart';
import 'package:todo_mobile_app/core/error/failures.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/core/network/network_info.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_local_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_remote_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';
import 'package:todo_mobile_app/features/todo_list/data/repositories/task_repositorisImpl.dart';

import 'task_repository_impl_test.mocks.dart';

class MockLocalDataSource extends Mock implements TaskLocalDataSource {}

@GenerateMocks([NetworkInfo])
@GenerateMocks([TaskRemoteDataSource], customMocks: [MockSpec<TaskRemoteDataSource>(as: #MockRemoteDataSource, 
  )])
void main() {
late TaskRepositorisImpl repository;
late MockTaskRemoteDataSource mockRemoteDataSource;
late MockLocalDataSource mockLocalDataSource;
late MockNetworkInfo mockNetworkInfo;

setUp(
() {
mockRemoteDataSource = MockTaskRemoteDataSource();
mockLocalDataSource = MockLocalDataSource();
mockNetworkInfo = MockNetworkInfo();


  repository = TaskRepositorisImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo);
},
);

void runTestOnline(Function body){
group('device is online', () {
setUp(() {
when(mockNetworkInfo.isConnected).thenAnswer((_)async => true);
});

   body();
});
}

void runTestOffline(Function body){
group('device is offline', () {
setUp(() {
when(mockNetworkInfo.isConnected).thenAnswer((_)async => false);
});

   body();
});
}

group('searchTask', () {
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

// test('should check if the device is online', () async {
//   // assuming we get the id from a remote source for practicing purposes

//   // arrange
//   when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

//   // act
//   repository.searchTask(id);

//   // assert
//   verify(mockNetworkInfo.isConnected);
// });

runTestOnline((){
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

  test('should cache the data locally when the call to remote data source is succesfull', ()async{
    // arrange
    when(mockRemoteDataSource.searchTask(any)).thenAnswer((_) async => tTaskModel);

    // act
    await repository.searchTask(id);

    // assert
    verify(mockRemoteDataSource.searchTask(id));
    verify(mockLocalDataSource.cacheTask(tTaskModel));

  });

  test('should return server failiure when the call to remote data source is unsuccessfull', () async{
    // arrange
    when(mockRemoteDataSource.searchTask(any)).thenThrow(ServerException());

    // act
    final result =  await repository.searchTask(id);

    // assert
    verify(mockRemoteDataSource.searchTask(id));
    verifyZeroInteractions(mockLocalDataSource);
    expect(result, equals(Left(ServerFailure())));

  });
});

runTestOffline((){
 test('should return last locally cached data when cached data is present', () async {
  // arrange
  when(mockLocalDataSource.getLastTask()).thenAnswer((_)async => tTaskModel);

  // act 
  final result = await repository.searchTask(id);

  // assert
  verifyZeroInteractions(mockRemoteDataSource);
  verify(mockLocalDataSource.getLastTask());
  expect(result, Right(tTaskModel));


 });

 test('should return Cache Failure when there is no cached data present', () async{
  // arrange
  when(mockLocalDataSource.getLastTask()).thenThrow(CacheException());

  // act
  final result = await repository.searchTask(id);

  // assert
  verifyZeroInteractions(mockRemoteDataSource);
  verify(mockLocalDataSource.getLastTask());
  expect(result, equals(Left(CacheFailure())));


 });
});

});

}