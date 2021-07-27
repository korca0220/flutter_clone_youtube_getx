import 'package:flutter/material.dart';
import 'package:flutter_clone_youtube_getx/app/ui/android/add/widget/item_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubuBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _header(),
            SizedBox(height: 10),
            ItemButton(
              onTap: () {
                print("동영상 업로드");
              },
              icon: "upload",
              iconSize: 17,
              label: "동영상 업로드",
            ),
            SizedBox(height: 10),
            ItemButton(
              onTap: () {
                print("실시간 스트리밍 시작");
              },
              icon: "broadcast",
              iconSize: 25,
              label: "실시간 스트리밍 시작",
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '만들기',
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
