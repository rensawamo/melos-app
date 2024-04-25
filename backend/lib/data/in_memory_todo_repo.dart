import 'package:model/model.dart';
import 'package:repository/repository.dart';

/// A class that implements [TodoRepo] using an in-memory list.
class InMemoryTodoRepo implements TodoRepo {
  List<Todo> _data = [
    Todo(id: "1", text: "todo"),
  ];

  /// Returns the list of todos.
  List<Todo> get todos => _data;


  @override
  Future<Todo> addTodo(Todo todo) async {
    final newtodo = todo;
    _data.add(newtodo);
    return newtodo;
  }

  @override
  Future<void> deleteTodo(String id) async {
    _data = [
      for (final todo in _data)
        if (todo.id != id) todo
    ];
  }

  @override
  Future<List<Todo>> fetchAllTodo() async {
    return _data;
  }

  @override
  Future<Todo> getTodoById(String id) async {
    return _data.firstWhere((todo) => todo.id == id);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    _data = [
      for (final t in _data)
        if (t.id == todo.id) todo else t
    ];
  }
}
