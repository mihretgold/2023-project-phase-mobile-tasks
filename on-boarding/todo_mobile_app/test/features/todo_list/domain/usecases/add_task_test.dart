// import 'package:dartz/dartz.dart';
// import 'package:dartz/dartz.dart' show unit;
// import 'package:mockito/mockito.dart';
// import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
// import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:todo_mobile_app/features/todo_list/domain/usecases/add_task.dart';

// class MockTaskRepository extends Mock implements TaskRepository {}

// void main() {
//   late AddTask usecase;
//   late MockTaskRepository mockTaskRepository;

//   setUp(() {
//     mockTaskRepository = MockTaskRepository();
//     usecase = AddTask(mockTaskRepository);
//   });

//   final tTasks = Tasks("Test", "Mock Testing", DateTime.now(), false);
//   test('should add task', () async {
//     //arrange
//     when(mockTaskRepository.addTask(tTasks))
//         .thenAnswer((_) async => const Right(unit));
//     //act
//     final result = await usecase.execute(task: tTasks);

//     //assert
//     expect(result, const Right(unit));
//     verify(mockTaskRepository.addTask(tTasks));
//     verifyNoMoreInteractions(mockTaskRepository);
//   });
// }
