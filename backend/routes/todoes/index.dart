import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';


Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => await _onGet(context),
    HttpMethod.post => await _onPost(context),
    _ => Response(statusCode: HttpStatus.notFound)
  };
}

Future<Response> _onGet(RequestContext context) async {
  final todos = await context.read<TodoRepo>().fetchAllTodo();
  final json = [for (final todo in todos) todo.toJson()];
  return Response.json(body: json);
}

Future<Response> _onPost(RequestContext context) async {
  final json = await context.request.json() as Map<String, dynamic>;
  final todo = await context.read<TodoRepo>().addTodo(Todo.fromJson(json));
  return Response.json(body: todo.toJson());
}
