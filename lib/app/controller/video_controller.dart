import 'package:flutter_clone_youtube_getx/app/data/model/statistics.dart';
import 'package:flutter_clone_youtube_getx/app/data/model/video.dart';
import 'package:flutter_clone_youtube_getx/app/data/model/youtuber.dart';
import 'package:flutter_clone_youtube_getx/app/data/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  final Video? video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video!.id.videoId);
    Youtuber loadYoutuber = await YoutubeRepository.to
        .getYoutuberInfoById(video!.snippet.channelId);
    statistics(loadStatistics);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => statistics.value.viewCount;
  String get likeCountString => statistics.value.likeCount;
  String get dislikeCountString => statistics.value.dislikeCount;
  String get favoriteCountString => statistics.value.favoriteCount;
  String get commentCountString => statistics.value.commentCount;
  String get subscriberCountString =>
      youtuber.value.statistics!.subscriberCount;
  String get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null)
      return "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=6&m=1223671392&s=612x612&w=0&h=NGxdexflb9EyQchqjQP0m6wYucJBYLfu46KCLNMHZYM=";
    return youtuber.value.snippet!.thumbnails.medium.url;
  }
}
