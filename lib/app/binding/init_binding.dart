import 'package:flutter_clone_youtube_getx/app/controller/root_controller.dart';
import 'package:flutter_clone_youtube_getx/app/data/repository/youtube_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<YoutubeRepository>(YoutubeRepository(), permanent: true);
    Get.put<RootController>(RootController());
  }
}
