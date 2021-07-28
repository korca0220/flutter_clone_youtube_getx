import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }

  Widget _thumnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.3),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(
              "https://yt3.ggpht.com/yti/APfAmoG9Z6GyerJlMhoi1lnfy7GBQl6oCeSLL3CfDg=s88-c-k-c0x00ffffff-no-rj-mo",
              fit: BoxFit.cover,
            ).image,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "유튜브 다시 보기 유튜브 다시 보기 유튜브 다시 보기 유튜브 다시 보기 유튜브 다시 보기",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.topCenter,
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        size: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Junewoo Park',
                      style: TextStyle(
                          fontSize: 10, color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(" · "),
                    Text(
                      '조회수 1210회',
                      style: TextStyle(
                          fontSize: 10, color: Colors.black.withOpacity(0.6)),
                    ),
                    Text(" · "),
                    Text(
                      '2021-02-13',
                      style: TextStyle(
                          fontSize: 10, color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
