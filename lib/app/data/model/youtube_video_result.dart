import 'package:flutter_clone_youtube_getx/app/data/model/video.dart';

class YoutubeVideoResult {
  int totalResults;
  int resultsPerPage;
  String nextPageToken;
  List<Video> items;

  YoutubeVideoResult({
    this.totalResults = 0,
    this.resultsPerPage = 0,
    this.nextPageToken = "",
    this.items = const [],
  });

  factory YoutubeVideoResult.fromJson(Map<dynamic, dynamic> json) {
    return YoutubeVideoResult(
      totalResults: json["pageInfo"]["totalResults"],
      resultsPerPage: json["pageInfo"]["resultsPerPage"],
      nextPageToken: json["nextPageToken"] ?? "",
      items: List<Video>.from(
        json["items"].map(
          (data) => Video.fromJson(data),
        ),
      ).toList(),
    );
  }
}
