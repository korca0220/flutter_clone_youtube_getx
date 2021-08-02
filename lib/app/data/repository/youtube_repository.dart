import 'package:flutter_clone_youtube_getx/app/data/model/statistics.dart';
import 'package:flutter_clone_youtube_getx/app/data/model/youtube_video_result.dart';
import 'package:flutter_clone_youtube_getx/app/data/model/youtuber.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  loadVideos(String? nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyDaNXxR6b_Sx1j4zb1ouAa5eFl9-5IdOUs&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
    return null;
  }

  saerch(String searchKeyword, String? nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyDaNXxR6b_Sx1j4zb1ouAa5eFl9-5IdOUs&pageToken=$nextPageToken&q=$searchKeyword";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
    return null;
  }

  getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=snippet,statistics&key=AIzaSyDaNXxR6b_Sx1j4zb1ouAa5eFl9-5IdOUs&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
    return null;
  }

  getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyDaNXxR6b_Sx1j4zb1ouAa5eFl9-5IdOUs&id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
    return null;
  }
}
