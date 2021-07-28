import 'package:flutter/material.dart';
import 'package:flutter_clone_youtube_getx/app/routes/app_pages.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/home/widget/custom_apbbar.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/home/widget/video_widget.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
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
                  child: VideoWidget(),
                  onTap: () {
                    Get.toNamed('${Routes.DETAIL}239588');
                  },
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
