import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';
import 'package:todo_mobile_app/features/todo_list/domain/repositories/task_repositories.dart';
import 'package:todo_mobile_app/features/todo_list/domain/usecases/add_task.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

@GenerateMocks([Tasks])
void main() {
  late AddTask usecase;
  late MockTaskRepository mockTaskRepository;
  late Tasks tTasks;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = AddTask(mockTaskRepository);
    tTasks = Tasks(id : 1, title : "Test", description: "Mock Testing", dueDate : DateTime.now(), status : false);
  });

  test('should add task', () async {
    //arrange
    when(mockTaskRepository.addTask(tTasks))
        .thenAnswer((_) async => const Right(unit));
    //act
    final result = await usecase(Params(tTasks));

    //assert
    expect(result, const Right(unit));
    verify(mockTaskRepository.addTask(tTasks));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
