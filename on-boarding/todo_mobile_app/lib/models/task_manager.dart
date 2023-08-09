/*
  Task Manager class
 */

import '../features/todo_list/domain/entities/tasks.dart';

class TaskManager {
  static List<Tasks> tasks = [];
  TaskManager();

  List<Tasks> get tasksList {
    return tasks;
  }

  void addTask(Tasks task) {
    tasks.add(task);
    print("New Task Successfully added!");
  }

  void viewAllTasks() {
    if (tasks.isEmpty) {
      print("No tasks found.");
      return;
    }

    for (Tasks task in tasks) {
      task.displayTask();
    }
  }

  void viewCompletedTasks() {
    List<Tasks> completedTasks = tasks.where((data) => data.status).toList();

    if (completedTasks.isEmpty) {
      print("No completed tasks found.");
      return;
    }

    for (Tasks task in completedTasks) {
      task.displayTask();
    }
  }

  void viewPendingTasks() {
    List<Tasks> pendingTasks = tasks.where((data) => !data.status).toList();

    if (pendingTasks.isEmpty) {
      print("No pending tasks found.");
      return;
    }

    for (Tasks task in pendingTasks) {
      task.displayTask();
    }
  }

  Tasks? searchTask(String title) {
    for (Tasks task in tasks) {
      if (task.title.toLowerCase() == title.toLowerCase()) {
        return task;
      }
    }

    return null;
  }

  void editTask(Tasks task, String title, String description, DateTime dueDate,
      bool status) {
    task.title = title;
    task.description = description;
    task.dueDate = dueDate;
    task.status = status;

    print("Task Successfully Updated");
  }

  void delete(Tasks task) {
    tasks.remove(task);
    print("Task Successfully Deleted");
  }
}
