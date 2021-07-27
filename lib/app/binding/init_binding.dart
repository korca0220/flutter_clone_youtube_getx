import 'package:flutter_clone_youtube_getx/app/controller/root_controller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RootController>(RootController());
  }
}
