import 'package:flutter/cupertino.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/add/components/youtube_bottomsheet.dart';
import 'package:get/get.dart';

enum RouteName {
  Home,
  Explore,
  Add,
  Subs,
  Library,
}

class RootController extends GetxService {
  static RootController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void chnagePageIndex(int selectedIndex) {
    if (RouteName.values[selectedIndex] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(selectedIndex);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(YoutubuBottomSheet());
  }
}
