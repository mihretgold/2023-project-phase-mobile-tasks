import 'package:todo_mobile_app/features/todo_list/domain/entities/tasks.dart';

abstract class TaskLocalDataSource{
  Future<Tasks> getLastTitle();
  Future<void> cacheTask(Tasks task);
}