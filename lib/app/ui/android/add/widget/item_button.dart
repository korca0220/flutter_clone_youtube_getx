import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemButton extends StatelessWidget {
  final String icon;
  final double iconSize;
  final String label;
  final VoidCallback onTap;
  const ItemButton({
    Key? key,
    this.icon = "",
    this.iconSize = 14.0,
    this.label = "",
    this.onTap = dummyOnTap,
  }) : super(key: key);

  static void dummyOnTap() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Container(
              width: iconSize,
              height: iconSize,
              child: SvgPicture.asset(
                "assets/svg/icons/$icon.svg",
              ),
            ),
          ),
          SizedBox(width: 15),
          Text("$label")
        ],
      ),
    );
  }
}
