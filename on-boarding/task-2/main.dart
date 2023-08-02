
import 'dart:io';
import 'Models/task.dart';
import 'Models/task_manager.dart';

void main() {
  TaskManager taskManager = TaskManager([]);
  bool exit = false;

  while (!exit) {
    print("WELCOME TO MIHRET TASK MANAGER");
    print("");
    print("   Press 1 to Add a new task");
    print("   Press 2 to View all tasks");
    print("   Press 3 to View completed tasks");
    print("   Press 4 to View pending tasks");
    print("   Press 5 to Edit a Task");
    print("   Press 6 to Delete a Task");
    print("   Press 7 to Exit");
    print("");

    int choice = int.parse(stdin.readLineSync() ?? '0');

    switch (choice) {
      case 1:
        String title = getTitleFromUser('');

        print('Enter task description:');
        String description = stdin.readLineSync() ?? '';

        print('Enter task due date (YYYY-MM-DD):');
        String dueDateStr = stdin.readLineSync() ?? '';
        DateTime dueDate = DateTime.tryParse(dueDateStr) ?? DateTime.now();

        print('Enter task status (Enter y if complete)');
        String statusString = stdin.readLineSync() ?? '';
        bool status = false;

        if (statusString.toLowerCase() == "y") {
          status = true;
        }

        Task task = Task(title, description, dueDate, status);
        taskManager.addTask(task);
        break;

      case 2:
        taskManager.viewAllTasks();
        break;

      case 3:
        taskManager.viewCompletedTasks();
        break;

      case 4:
        taskManager.viewPendingTasks();
        break;

      case 5:
        String title = getTitleFromUser('');

        Task? task = taskManager.searchTask(title);
        if (task != null) {
          task.displayTask();
          String newTitle = getTitleFromUser('');

          print('Enter task description:');
          String description = stdin.readLineSync() ?? '';

          print('Enter task due date (YYYY-MM-DD):');
          String dueDateStr = stdin.readLineSync() ?? '';
          DateTime dueDate = DateTime.tryParse(dueDateStr) ?? DateTime.now();

          print('Enter task status (Enter y if complete)');
          String statusString = stdin.readLineSync() ?? '';
          bool status = false;

          if (statusString.toLowerCase() == "y") {
            status = true;
          }

          taskManager.editTask(task, newTitle, description, dueDate, status);
        } else {
          print("Task Not Found");
        }

        break;

      case 6:
        String title = getTitleFromUser('');

        Task? task = taskManager.searchTask(title);
        if (task != null) {
          taskManager.delete(task);
        } else {
          print("Task Not Found");
        }
        break;

      case 7:
        exit = true;
        break;

      default:
        print("Please pick a number from 1 - 7");
    }
  }
}

String getTitleFromUser(String title) {
  while (title.isEmpty) {
    print('Enter task title of task:');
    title = stdin.readLineSync() ?? '';
    if (title.isEmpty) {
      print('Task title cannot be empty. Please try again.');
    }
  }
  return title;
}
