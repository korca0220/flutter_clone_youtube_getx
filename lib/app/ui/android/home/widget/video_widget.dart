import 'package:flutter/material.dart';
import 'package:flutter_clone_youtube_getx/app/data/model/video.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatelessWidget {
  final Video video;
  const VideoWidget({
    required this.video,
  });

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
      height: 200,
      color: Colors.grey.withOpacity(0.3),
      child: Image.network(
        video.snippet.thumbnails.medium.url,
        fit: BoxFit.fitWidth,
      ),
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
                        video.snippet.title,
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
                      video.snippet.channelTitle,
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
                      DateFormat("yyyy-MM-dd")
                          .format(video.snippet.publishTime),
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
