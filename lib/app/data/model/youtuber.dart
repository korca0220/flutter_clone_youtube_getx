import 'package:flutter_clone_youtube_getx/app/data/model/statistics.dart';
import 'package:flutter_clone_youtube_getx/app/data/model/video.dart';

class Youtuber {
  Youtuber({
    this.snippet,
    this.statistics,
  });

  YoutuberSnippet? snippet;
  YoutuberStatistics? statistics;

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
        snippet: YoutuberSnippet.fromJson(json["snippet"]),
        statistics: YoutuberStatistics.fromJson(json["statistics"]),
      );
}

class YoutuberSnippet {
  YoutuberSnippet({
    required this.title,
    required this.description,
    required this.customUrl,
    required this.publishedAt,
    required this.thumbnails,
    required this.localized,
    required this.country,
  });

  String title;
  String description;
  String customUrl;
  DateTime publishedAt;
  Thumbnails thumbnails;
  Localized localized;
  String country;

  factory YoutuberSnippet.fromJson(Map<String, dynamic> json) =>
      YoutuberSnippet(
        title: json["title"],
        description: json["description"],
        customUrl: json["customUrl"] == null ? "" : json["customUrl"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        localized: Localized.fromJson(json["localized"]),
        country: json["country"] == null ? "" : json["country"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "customUrl": customUrl,
        "publishedAt": publishedAt.toIso8601String(),
        "thumbnails": thumbnails.toJson(),
        "localized": localized.toJson(),
        "country": country,
      };
}

class Localized {
  Localized({
    required this.title,
    required this.description,
  });

  String title;
  String description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class Default {
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class YoutuberStatistics {
  YoutuberStatistics({
    required this.viewCount,
    required this.subscriberCount,
    required this.hiddenSubscriberCount,
    required this.videoCount,
  });

  String viewCount;
  String subscriberCount;
  bool hiddenSubscriberCount;
  String videoCount;

  factory YoutuberStatistics.fromJson(Map<String, dynamic> json) =>
      YoutuberStatistics(
        viewCount: json["viewCount"],
        subscriberCount:
            json["subscriberCount"] == null ? "" : json["subscriberCount"],
        hiddenSubscriberCount: json["hiddenSubscriberCount"] == null
            ? ""
            : json["hiddenSubscriberCount"],
        videoCount: json["videoCount"] == null ? "" : json["videoCount"],
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "subscriberCount": subscriberCount,
        "hiddenSubscriberCount": hiddenSubscriberCount,
        "videoCount": videoCount,
      };
}
