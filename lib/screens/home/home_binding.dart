import 'package:get/get.dart';
import 'package:todolite/models/task.dart';
import 'package:todolite/repos/dynamic_repo.dart';
import 'package:todolite/screens/home/controllers/task_controller.dart';

import 'controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      repo: DynamicRepo<Task>()
    ));
    Get.lazyPut(() => TaskController.all(
        repo: DynamicRepo<Task>()
    ));
    Get.lazyPut(() => TaskController.doing(
        repo: DynamicRepo<Task>()
    ), tag: Task.DOING_STATUS.toString());
    Get.lazyPut(() => TaskController.done(
        repo: DynamicRepo<Task>()
    ), tag: Task.DONE_STATUS.toString());
  }
}