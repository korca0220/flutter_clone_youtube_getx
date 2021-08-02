import 'package:flutter/material.dart';
import 'package:flutter_clone_youtube_getx/app/data/model/youtube_video_result.dart';
import 'package:flutter_clone_youtube_getx/app/data/repository/youtube_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeSearchController extends GetxController {
  late SharedPreferences profs;
  late ScrollController scrollController;
  String key = "SearchKey";
  String currentKeyword = "";
  RxList<String> history = <String>[].obs;
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() async {
    profs = await SharedPreferences.getInstance();
    scrollController = ScrollController();
    List<String> initData = profs.getStringList(key) ?? [""];
    history(initData.map((e) => e.toString()).toList());
    _event();
    super.onInit();
  }

  void search(String keyword) {
    history.addIf(!history.contains(keyword), keyword);
    profs.setStringList(key, history);
    currentKeyword = keyword;
    if (youtubeVideoResult.value.items.isNotEmpty) {
      youtubeVideoResult.value.items.clear();
      scrollController.jumpTo(0.0);
    }
    _searchYoutube(keyword);
  }

  void _searchYoutube(String keyword) async {
    YoutubeVideoResult? result = await YoutubeRepository.to
        .saerch(keyword, youtubeVideoResult.value.nextPageToken);

    if (result != null && result.items.length > 0) {
      youtubeVideoResult.update((youtube) {
        youtube!.nextPageToken = result.nextPageToken;
        youtube.items.addAll(result.items);
      });
    }
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken.isNotEmpty) {
        _searchYoutube(currentKeyword);
      }
    });
  }
}
