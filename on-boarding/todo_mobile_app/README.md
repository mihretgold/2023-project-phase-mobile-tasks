# To Do Mobile App

This project is a Todo Mobile app.

## Screenshots
| ![onboarding](ScreenShots/onboarding.png) | ![add_task](ScreenShots/add_task.png)|
| ---------------------- | ---------------------- |
| ![home](ScreenShots/home.png) | ![home2](ScreenShots/home2.png)|
| ---------------------- | ---------------------- |
| ![task_detail1](ScreenShots/task_detail1.png) | ![task_detail2](ScreenShots/task_detail2.png)|
## Update Flutter task 7 Part 2: TDD and Clean Architecture 

1. Entities:
```
class Tasks {
  static int _currentId = 0;
  int id;
  String _title;
  String _description;
  DateTime _dueDate;
  bool _status;

  Tasks(this._title, this._description, this._dueDate, this._status) : id = ++ _currentId;

  set title(String title) {
    _title = title;
  }

  String get title => _title;

  set description(String description) {
    _description = description;
  }

  String get description => _description;

  set dueDate(DateTime dueDate) {
    _dueDate = dueDate;
  }

  DateTime get dueDate => _dueDate;

  set status(bool status) {
    _status = status;
  }

  bool get status => _status;

  void markCompleted(){
    _status = true;
  }

  void displayTask() {
    print("Title:  $_title");
    print("Description:  $_description");
    print("Due Date:  $_dueDate");
    print("Status:  $_status");
  }
}
```
2. UseCases:
   ```    
    abstract class UseCase<Type, Params> {
    Future<Either<Failure, Type>?> call(Params params);
    }
    
    class NoParams extends Equatable {
      @override
      List<Object?> get props => [];
    }

   ```
   
 - View All Tasks
      ```

        class ViewAllTask implements UseCase<List<Tasks>, NoParams> {
          final TaskRepository repository;
        
          ViewAllTask(this.repository);
        
          @override
          Future<Either<Failure, List<Tasks>>?> call(NoParams params) async {
           return await repository.viewAllTasks();
          }
        }

    ```
- View Specific Tasks
    ```
        class ViewSpecificTask implements UseCase<Tasks, Params> {
          final TaskRepository repository;
        
          ViewSpecificTask(this.repository);
        
          @override
          Future<Either<Failure, Tasks>?> call(Params params) async {
            try {
              final task = await repository.searchTask(params.id);
              return task;
            } catch (e) {
              return Left(TaskFailure(
                  message: 'Failed to retrieve task', type: e.runtimeType));
            }
          }
        }
        
        class Params {
          final int id;
          const Params(this.id);
        }


      ```
- Create New Tasks
  
      ```
        class AddTask implements UseCase<Unit, Params> {
          final TaskRepository repository;
        
          AddTask(this.repository);
        
          @override
          Future<Either<Failure, Unit>> call(Params params) async {
            try {
              await repository.addTask(params.task);
              return const Right(unit);
            } catch (e) {
              return Left(
                  TaskFailure(message: 'Failed to retrieve task', type: 
                  e.runtimeType));
            }
          }
        }
        
        class Params {
          final Tasks task;
          const Params(this.task);
        }

      ```
3. UseCases Testing:
   
   ![Screenshot (695)](https://github.com/mihretgold/2023-project-phase-mobile-tasks/assets/102969913/974ec30f-3f0f-4f86-9be7-63270577adc0)

   -Add task Test
   ```
   class MockTaskRepository extends Mock implements TaskRepository {}

    @GenerateMocks([Tasks])
    void main() {
      late AddTask usecase;
      late MockTaskRepository mockTaskRepository;
      late Tasks tTasks;
    
      setUp(() {
        mockTaskRepository = MockTaskRepository();
        usecase = AddTask(mockTaskRepository);
        tTasks = Tasks("Test", "Mock Testing", DateTime.now(), false);
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

   ```
- View Task Test
   ```
   class MockTaskRepository extends Mock implements TaskRepository {}

    @GenerateMocks([Tasks])
    void main() {
      group('ViewAllTaskUseCase', () {
        late ViewAllTask usecase;
        late MockTaskRepository mockTaskRepository;
        late List<Tasks> tTask;
    
        setUp(() {
          mockTaskRepository = MockTaskRepository();
          usecase = ViewAllTask(mockTaskRepository);
          tTask = [
            Tasks('Test Title', 'Test description', DateTime.now(), false),
            Tasks('Test2 Title', 'Test2 description', DateTime.now(), true),
          ];
        });
    
        test('should Get a list of tasks from repository', () async {
          // Arrange
          when(mockTaskRepository.viewAllTasks())
              .thenAnswer((_) async => Right(tTask));
    
          //Act
          final result = await usecase(NoParams());
    
          //Assert
          expect(result, Right(tTask));
          verify(mockTaskRepository.viewAllTasks());
          verifyNoMoreInteractions(mockTaskRepository);
        });
      });
    }
   ```
   


## Update Flutter task 7 Part 1: TDD and Clean Architecture 

1. Set Due Date Feature:
```
void editTask() {
    String taskName = _taskNameController.text;
    String taskDescription = _taskDescriptionController.text;
    String taskDate = _taskDateController.text;
    bool status = widget.task.status;

    DateTime parsedDate = DateTime.tryParse(taskDate) ?? DateTime.now();

    if (taskName.isNotEmpty && taskDescription.isNotEmpty) {
      TaskRepositorisImpl taskManager = TaskRepositorisImpl();
      taskManager.editTask(
          widget.task, taskName, taskDescription, parsedDate, status);
    }

    Navigator.pushNamed(context, viewTask,
        arguments: {'title': taskName, 'description': taskDescription});
  }
```
```
  TextField(
        key: Key(widget.keys),
        maxLines: widget.lines,
        controller: widget.controller, // Disable text input
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: widget.setDate
              ? const Icon(
                  Icons.calendar_month,
                  color: Color.fromRGBO(243, 140, 89, 1),
                )
              : null,
        ),
       
        onTap: widget.setDate
            ? () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    widget.controller.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                  });
                }
              }
            : null,
      )
  ```    
2. Mark Tasks as Completed Feature:

  ```
  void complete() {
    TaskRepositorisImpl taskManager = TaskRepositorisImpl();
    taskManager.markComplete(widget.task);

    Navigator.pushNamed(context, viewTask,
        arguments: {'title': '', 'description': ''});
  }
```
```
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                complete();
              },
              child: const Text(
                "Completed",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold),
              ),
            )
```
3. Error Handling and Either Type:
```
   
  @override
  Future<Either<Failure, Unit>> addTask(Tasks task) async {
    try {
      tasks.add(task);
      return const Right(unit);
    } catch (e) {
      return Left(
          TaskFailure(message: 'Failed to add task', type: e.runtimeType));
    }
  }
```
          





## Update Flutter task 6: Testing

![Screenshot (684)](https://github.com/mihretgold/2023-project-phase-mobile-tasks/assets/102969913/1742645e-84c7-481e-933e-e04c9acc20cf)


1. Test Task Listing

```
testWidgets('Test Task Listing', (WidgetTester tester) async {
  // Build our app and trigger a frame.
  await tester.pumpWidget(
    MaterialApp(
      home: ViewToDoList(values: {'title': '', 'description': ''}),
    ),
  );

  // Add your test assertions here
});
```

2. Test Task Creation

```
testWidgets('Test task Creation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        title: "To Do Mobile App",
        onGenerateRoute: MyRoutes.generateRoute,
        initialRoute: '/addTask',
      ),
    );

    await tester.enterText(find.byKey(const Key('titleField')), 'Task Title');
    await tester.enterText(
        find.byKey(const Key('descriptionField')), 'Task Description');

    final addTaskButton = find.text('Add task');

    await tester.tap(addTaskButton);
    await tester.pumpAndSettle();

    // Verify the task object.
    final task = Task('Task Title', 'Task Description', DateTime.now(), false);

    // Verify that our counter starts at 0.
    expect(task.title, 'Task Title');
    expect(task.description, 'Task Description');
  });
```
3. Test onboarding page navigation

```
testWidgets('Test onboarding page navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: MyApp(),
      ),
    );

    final getStartedButton = find.text('Get Started');
    await tester.tap(getStartedButton);
    await tester.pumpAndSettle();
    // Verify that our counter starts at 0.
    expect(find.byType(ViewToDoList), findsOneWidget);
  });
```
4. Add task displays correct UI

```
testWidgets('Add task displays correct UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: NewTaskFrame()
      ),
    );

    // Verify that various text elements are found.
    expect(find.text('Create new task'), findsOneWidget);
    expect(find.text('Main task name'), findsOneWidget);
    expect(find.text('Due date'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
```

5. Test empty tasks

```
testWidgets('Test empty tasks', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: NewTaskFrame(),
      ),
    );

    final textFieldFinder = find.byKey(const Key('titleField'));
    final textField = tester.widget<TextField>(textFieldFinder);

    expect(textField.controller!.text.isEmpty, isTrue);
  });

```

## Installation

To install and run the Todo App, please follow the steps below:

1. Make sure you have Flutter and Dart installed on your machine. If not, please refer to the official Flutter installation guide: [Flutter Installation](https://flutter.dev/docs/get-started/install)

2. Clone the repository from GitHub:
git clone https://github.com/mihretgold/2023-project-phase-mobile-tasks.git


3. Navigate to the project directory:

cd todo_mobile_app
git checkout -b mihret.navigation_task
git pull origin mihret.navigation_task

4. Fetch the dependencies:
 -flutter pub get

5. Connect your device or start an emulator.

6. Run the app:
  -flutter run
