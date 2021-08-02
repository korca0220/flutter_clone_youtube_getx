import 'package:flutter_clone_youtube_getx/app/controller/detail/youtube_detail_controller.dart';
import 'package:flutter_clone_youtube_getx/app/controller/home/search_controller.dart';
import 'package:flutter_clone_youtube_getx/app/root.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/detail/youtube_detail.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/home/search.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => Root()),
    GetPage(
      name: "${Routes.DETAIL}:videoId",
      page: () => YoutubeDetail(),
      binding: BindingsBuilder(
        () => Get.lazyPut<YoutubeDetailController>(
          () => YoutubeDetailController(),
        ),
      ),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => YoutubeSearch(),
      binding: BindingsBuilder(
        () => Get.lazyPut<YoutubeSearchController>(
            () => YoutubeSearchController()),
      ),
    ),
  ];
}
