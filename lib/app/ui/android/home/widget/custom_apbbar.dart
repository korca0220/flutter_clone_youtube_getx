import 'package:flutter/material.dart';
import 'package:flutter_clone_youtube_getx/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logo(),
          _actions(),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset("assets/svg/icons/bell.svg"),
          ),
        ),
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SEARCH);
          },
          child: Container(
            width: 33,
            height: 33,
            child: SvgPicture.asset("assets/svg/icons/search.svg"),
          ),
        ),
        SizedBox(width: 15),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: Image.network(
            "https://yt3.ggpht.com/yti/APfAmoG9Z6GyerJlMhoi1lnfy7GBQl6oCeSLL3CfDg=s88-c-k-c0x00ffffff-no-rj-mo",
            fit: BoxFit.cover,
          ).image,
        ),
      ],
    );
  }
}
