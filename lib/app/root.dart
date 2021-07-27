import 'package:flutter/material.dart';
import 'package:flutter_clone_youtube_getx/app/controller/root_controller.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/explore/explore.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/home/home.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/library/library.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/subscribe/subscribe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Root extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.Home:
            return Home();
          case RouteName.Explore:
            return Explore();
          case RouteName.Add:
          //bottomsheet
          case RouteName.Subs:
            return Subscribe();
          case RouteName.Library:
            return Library();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: controller.chnagePageIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/compass_off.svg",
                  width: 22),
              activeIcon: SvgPicture.asset("assets/svg/icons/compass_on.svg",
                  width: 22),
              label: "탐색",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/plus.svg",
                width: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/subs_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg"),
              label: "구독",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/library_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg"),
              label: "보관함",
            ),
          ],
        ),
      ),
    );
  }
}
