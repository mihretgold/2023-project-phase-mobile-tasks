import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mobile_app/features/todo_list/domain/usecases/view_all_task.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  group('ViewAllTaskUseCase', () {
    late ViewAllTask usecase;
    late MockTaskRepository mockTaskRepository;

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      usecase = ViewAllTask(mockTaskRepository);
    });

    final tasks = [
      Tasks('Test Title', 'Test description', DateTime.now(), false),
      Tasks('Test2 Title', 'Test2 description', DateTime.now(), true),
    ];

    test('should Get a list of tasks from repository', () async {
      // Arrange
      when(mockTaskRepository.viewAllTasks())
          .thenAnswer((_) async => Right(tasks));

      //Act
      final result = await usecase(NoParams as NoParams);

      //Assert
      expect(result, Right(tasks));
      verify(mockTaskRepository.viewAllTasks());
      verifyNoMoreInteractions(mockTaskRepository);
    });
  });
}
