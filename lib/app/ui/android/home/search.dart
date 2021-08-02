import 'package:flutter/material.dart';
import 'package:flutter_clone_youtube_getx/app/controller/home/search_controller.dart';
import 'package:flutter_clone_youtube_getx/app/routes/app_pages.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/home/widget/video_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class YoutubeSearch extends GetView<YoutubeSearchController> {
  const YoutubeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: SvgPicture.asset("assets/svg/icons/back.svg"),
        ),
        title: TextField(
          decoration: InputDecoration(
            fillColor: Colors.grey.withOpacity(0.2),
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onSubmitted: (keyword) {
            controller.search(keyword);
          },
        ),
      ),
      body: Obx(() => controller.youtubeVideoResult.value.items.length > 0
          ? _searchResultView()
          : _searchHistory()),
    );
  }

  Widget _searchHistory() {
    return ListView(
      children: List.generate(
        controller.history.length,
        (index) => ListTile(
          leading:
              SvgPicture.asset("assets/svg/icons/wall-clock.svg", width: 20),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(controller.history[index]),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
          onTap: () {
            controller.search(controller.history[index]);
          },
        ),
      ),
    );
  }

  Widget _searchResultView() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: List.generate(
          controller.youtubeVideoResult.value.items.length,
          (index) => GestureDetector(
            child: VideoWidget(
              video: controller.youtubeVideoResult.value.items[index],
            ),
            onTap: () {
              Get.toNamed(
                  '${Routes.DETAIL}${controller.youtubeVideoResult.value.items[index].id.videoId}');
            },
          ),
        ),
      ),
    );
  }
}
