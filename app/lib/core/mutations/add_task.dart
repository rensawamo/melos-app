import 'package:app/core/data/remote_task_repo.dart';
import 'package:app/core/store/task_store.dart';
import 'package:model/model.dart';
import 'package:uuid/uuid.dart';
import 'package:velocity_x/velocity_x.dart';
import 'get_all_tasks.dart';

class AddTaskMutation extends VxMutation<TaskStore> {
  final String task;

  AddTaskMutation(this.task);

  @override
  perform() async {
    final Task newTask =
        Task(id: const Uuid().v4(), title: task, isCompleted: false);
    await RemoteTaskRepo().addTask(newTask);
    GetAllTasksMutation();
  }
}
