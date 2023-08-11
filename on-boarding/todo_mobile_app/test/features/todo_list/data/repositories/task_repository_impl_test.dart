import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_mobile_app/core/entities/tasks.dart';
import 'package:todo_mobile_app/core/platform/network_info.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_local_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/data/datasources/task_remote_data_source.dart';
import 'package:todo_mobile_app/features/todo_list/data/models/task_model.dart';
import 'package:todo_mobile_app/features/todo_list/data/repositories/task_repositorisImpl.dart';

class MockRemoteDataSource extends Mock implements TaskRemoteDataSource {}

class MockLocalDataSource extends Mock implements TaskLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([NetworkInfo])
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
  final TaskModel tTaskModel =
      TaskModel('title', 'description', DateTime.now(), false);
  
  test('should check if the device is online', () async {
    // assuming we get the id from a remote source for practicing purposes

    // arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

    // act
    repository.searchTask(id);

    // assert
    verify(mockNetworkInfo.isConnected);
  });

  // group('device is online', () { 
  //   //arrange
  //   setUp(() {
  //     when(t).thenAnswer((_)async => true);
  //   });

  //   // act
  //   final


  // group('device is offline', () { 
  //   setUp(() {
  //     when(mockNetworkInfo.isConnected).thenAnswer((_)async => false);
  //   });
  
}
