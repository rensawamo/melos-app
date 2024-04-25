// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../routes/index.dart' as index;
import '../routes/tasks/index.dart' as tasks_index;
import '../routes/tasks/[id].dart' as tasks_$id;
import '../routes/tasks/_middleware.dart' as tasks_middleware;

void main() async {
  final address = InternetAddress.tryParse('') ?? InternetAddress.anyIPv6;
  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  hotReload(() => createServer(address, port));
}

Future<HttpServer> createServer(InternetAddress address, int port) {
  final handler = Cascade().add(buildRootHandler()).handler;
  return serve(handler, address, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..mount('/tasks', (context) => buildTasksHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildTasksHandler() {
  final pipeline = const Pipeline().addMiddleware(tasks_middleware.middleware);
  final router = Router()
    ..all(
        '/',
        (context) => tasks_index.onRequest(
              context,
            ))
    ..all(
        '/<id>',
        (
          context,
          id,
        ) =>
            tasks_$id.onRequest(
              context,
              id,
            ));
  return pipeline.addHandler(router);
}


Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all(
        '/',
        (context) => index.onRequest(
              context,
            ));
  return pipeline.addHandler(router);
}
