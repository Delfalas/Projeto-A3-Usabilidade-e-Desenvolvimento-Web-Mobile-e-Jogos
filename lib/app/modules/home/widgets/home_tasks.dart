import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/task_model.dart';
import '../home_controller.dart';
import 'task.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Selector<HomeController, String>(
            selector: (context, controller) {
              return controller.selectedFilter.value;
            },
            builder: (_, value, __) => Text(
              'TASK\'S $value',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          Visibility(
            visible: context.select<HomeController, bool>(
                (controller) => controller.filteredTasks.isNotEmpty),
            replacement: Selector<HomeController, String>(
              selector: (context, controller) {
                return controller.tasksEmptyMessage;
              },
              builder: (_, value, __) => Text(
                value,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            child: Column(
              children: context
                  .select<HomeController, List<TaskModel>>(
                      (controller) => controller.filteredTasks)
                  .map((task) => Task(
                        taskModel: task,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
