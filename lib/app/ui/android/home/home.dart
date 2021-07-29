import 'package:flutter/material.dart';
import 'package:flutter_clone_youtube_getx/app/controller/home/home_controller.dart';
import 'package:flutter_clone_youtube_getx/app/routes/app_pages.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/home/widget/custom_apbbar.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/home/widget/video_widget.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CustomAppBar(),
              floating: true,
              snap: true,
              elevation: 0.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    child: VideoWidget(
                      video: controller.youtubeResult.value.items[index],
                    ),
                    onTap: () {
                      Get.toNamed('${Routes.DETAIL}:123412');
                    },
                  );
                },
                childCount: controller.youtubeResult.value.items.isEmpty
                    ? 0
                    : controller.youtubeResult.value.items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
