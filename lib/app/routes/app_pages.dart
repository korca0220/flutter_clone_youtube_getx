import 'package:flutter_clone_youtube_getx/app/root.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => Root()),
  ];
}
