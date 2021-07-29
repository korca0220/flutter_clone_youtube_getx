import 'package:flutter_clone_youtube_getx/app/data/model/youtube_video_result.dart';
import 'package:flutter_clone_youtube_getx/app/data/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult().obs;

  @override
  void onInit() {
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult? result = await YoutubeRepository.to.loadVideos();

    if (result != null && result.items.length > 0) {
      youtubeResult(result);
    }
  }
}
