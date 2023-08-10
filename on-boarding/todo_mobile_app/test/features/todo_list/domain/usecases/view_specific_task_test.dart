import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mobile_app/features/todo_list/domain/usecases/view_specific_task.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

@GenerateMocks([Tasks])
void main() {
  group('ViewSpecificTaskUseCase', () {
    late ViewSpecificTask usecase;
    late MockTaskRepository mockTaskRepository;
    late int id;
    late Tasks tTask;

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      usecase = ViewSpecificTask(mockTaskRepository);
      id = 1;
      tTask = Tasks('Test Title', 'Test description', DateTime.now(), false);
    });

    test('should Get a specific task from repository', () async {
      // Arrange
      when(mockTaskRepository.searchTask(id))
          .thenAnswer((_) async => Right(tTask));

      //Act
      final result = await usecase(Params(id));

      //Assert
      expect(result, Right(tTask));
      verify(mockTaskRepository.searchTask(id));
      verifyNoMoreInteractions(mockTaskRepository);
    });
  });
}
