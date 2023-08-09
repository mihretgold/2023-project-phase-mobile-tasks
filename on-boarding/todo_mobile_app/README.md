# To Do Mobile App

This project is a Todo Mobile app.

## Screenshots

![Screenshot_1691230313](https://github.com/mihretgold/2023-project-phase-mobile-tasks/assets/102969913/38412c2e-da1c-4e6d-9ab1-8749658c6027) ![Screenshot_1691230272](https://github.com/mihretgold/2023-project-phase-mobile-tasks/assets/102969913/7cc87155-008b-4d78-996b-c52764010ae3) ![Screenshot_1691332883](https://github.com/mihretgold/2023-project-phase-mobile-tasks/assets/102969913/6486d710-ea05-4eda-951e-f778444a3a3a) ![Screenshot_1691332890](https://github.com/mihretgold/2023-project-phase-mobile-tasks/assets/102969913/59f2660b-fb9d-4fe6-90f4-24d318e27b4e) ![Screenshot_1691298228](https://github.com/mihretgold/2023-project-phase-mobile-tasks/assets/102969913/df1903c0-2806-47c1-8c94-866fd36467bd) ![Screenshot_1691298237](https://github.com/mihretgold/2023-project-phase-mobile-tasks/assets/102969913/60d3b6fc-27bc-4361-9dea-fddb4cdfc0fc)
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
