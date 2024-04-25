import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';


Future<Response> onRequest(RequestContext context, String id) async {
  return switch (context.request.method) {
    HttpMethod.get => await _onGet(context, id),
    HttpMethod.put => await _onPut(context, id),
    HttpMethod.delete => await _onDelete(context, id),
    _ => Response(statusCode: HttpStatus.notFound)
  };
}

Future<Response> _onGet(RequestContext context, String id) async {
  final todo = await context.read<TodoRepo>().getTodoById(id);
  return Response.json(body: todo.toJson());
}

Future<Response> _onPut(RequestContext context, String id) async {
  final json = await context.request.json() as Map<String, dynamic>;
  final todo = Todo.fromJson(json).copyWith(id: id);
  await context.read<TodoRepo>().updateTodo(todo);
  return Response();
}

Future<Response> _onDelete(RequestContext context, String id) async {
  await context.read<TodoRepo>().deleteTodo(id);
  return Response();
}
