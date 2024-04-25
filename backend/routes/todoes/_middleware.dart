import 'package:backend/data/in_memory_todo_repo.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:repository/repository.dart';

InMemoryTodoRepo? _todoRepo;

Handler middleware(Handler handler) {
  return handler.use(
    provider<TodoRepo>((_) {
      _todoRepo ??= InMemoryTodoRepo();
      return _todoRepo!;
    }),
  );
}
