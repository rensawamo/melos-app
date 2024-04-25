import 'package:model/model.dart';

//  repository
abstract interface class TodoRepo {
  Future<List<Todo>> fetchAllTodo();
  Future<Todo> getTodoById(String id);
  Future<Todo> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
}
