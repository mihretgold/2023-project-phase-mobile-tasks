// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:todo_mobile_app/constants.dart';
// import 'package:todo_mobile_app/landing_page/to_do_frame.dart';
import 'package:todo_mobile_app/main.dart';
import 'package:todo_mobile_app/new_task/new_task_frame.dart';
import 'package:todo_mobile_app/models/task.dart';
// import 'package:todo_mobile_app/new_task/new_task_frame.dart';

// import 'package:todo_mobile_app/main.dart';
import 'package:todo_mobile_app/todo_list/view_todo_list.dart';
import 'package:todo_mobile_app/my_routes.dart';

void main() {
  testWidgets('Test Task Listing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: ViewToDoList(values: {'title':'', 'description':''}),
      ),
    );

    // Verify that various text elements are found.
    expect(find.text('Design'), findsOneWidget);
  });
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


}
