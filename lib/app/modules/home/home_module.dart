import 'package:provider/provider.dart';

import '../../core/modules/todo_list_module.dart';
import '../../data/repositories/task/i_task_repository.dart';
import '../../data/repositories/task/task_repository.dart';
import '../../data/services/task/i_task_service.dart';
import '../../data/services/task/task_service.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          bindings: [
            Provider<ITaskRepository>(
              create: (context) =>
                  TaskRepository(sqliteConnectionFactory: context.read()),
            ),
            Provider<ITaskService>(
              create: (context) => TaskService(taskRepository: context.read()),
            ),
            ChangeNotifierProvider(
              create: (context) => HomeController(taskService: context.read()),
            ),
          ],
          routers: {
            '/home': (context) => HomePage(controller: context.read()),
          },
        );
}
