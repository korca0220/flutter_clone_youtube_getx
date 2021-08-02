import 'package:flutter_clone_youtube_getx/app/controller/video_controller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  late VideoController videoController;
  late YoutubePlayerController playerController;

  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters["videoId"]);
    playerController = YoutubePlayerController(
      initialVideoId: Get.parameters["videoId"].toString(),
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true),
    );
    super.onInit();
  }

  String get title => videoController.video!.snippet.title;
  String get publishedTime => DateFormat("yyy-MM-dd")
      .format(videoController.video!.snippet.publishTime);
  String get discription => videoController.video!.snippet.description;
  String get likeCount => videoController.statistics.value.likeCount;
  String get dislikeCount => videoController.statistics.value.dislikeCount;
  String get viewCount => videoController.statistics.value.viewCount;
  String get youtuberThumbnailUrl => videoController.youtuberThumbnailUrl;
  String get youtuberName => videoController.youtuber.value.snippet!.title;
  String get subscriberCount =>
      videoController.youtuber.value.statistics!.subscriberCount;
}
