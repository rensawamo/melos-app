import 'package:app/core/mutations/get_all_tasks.dart';
import 'package:app/widgets/add_task_widget.dart';
import 'package:app/widgets/task_list_view.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        actions: [
          const VxDarkModeButton(
            showSingleIcon: true,
          ),
          IconButton(
            onPressed: () => GetAllTasksMutation(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TaskListView(),
        ),
      ),
      bottomNavigationBar: const AddTaskWidget(),
    );
  }
}
