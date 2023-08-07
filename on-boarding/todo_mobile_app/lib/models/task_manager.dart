/*
  Task Manager class
 */

import 'task.dart';

class TaskManager {
  List<Task> tasks;
  TaskManager(this.tasks);

  void addTask(Task task) {
    tasks.add(task);
    print("New Task Successfully added!");
  }

  void viewAllTasks() {
    if (tasks.isEmpty) {
      print("No tasks found.");
      return;
    }

    for (Task task in tasks) {
      task.displayTask();
    }
  }

  void viewCompletedTasks() {
    List<Task> completedTasks = tasks.where((data) => data.status).toList();

    if (completedTasks.isEmpty) {
      print("No completed tasks found.");
      return;
    }

    for (Task task in completedTasks) {
      task.displayTask();
    }
  }

  void viewPendingTasks() {
    List<Task> pendingTasks = tasks.where((data) => !data.status).toList();

    if (pendingTasks.isEmpty) {
      print("No pending tasks found.");
      return;
    }

    for (Task task in pendingTasks) {
      task.displayTask();
    }
  }

  Task? searchTask(String title) {
    for (Task task in tasks) {
      if (task.title.toLowerCase() == title.toLowerCase()) {
        return task;
      }
    }

    return null;
  }

  void editTask(Task task, String title, String description, DateTime dueDate,
      bool status) {
    task.title = title;
    task.description = description;
    task.dueDate = dueDate;
    task.status = status;

    print("Task Successfully Updated");
  }

  void delete(Task task) {
    tasks.remove(task);
    print("Task Successfully Deleted");
  }
}
