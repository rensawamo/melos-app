import 'package:model/model.dart';

//  repository
abstract interface class TaskRepo {
  Future<List<Task>> fetchAllTasks();
  Future<Task> getTaskById(String id);
  Future<Task> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}
