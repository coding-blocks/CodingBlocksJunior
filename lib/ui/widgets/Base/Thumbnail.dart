import 'package:flutter/material.dart';
import 'package:add_thumbnail/add_thumbnail.dart';

class ThumbnailView extends StatefulWidget {
  List<String> urls;

  ThumbnailView({this.urls});

  @override
  _ThumbnailViewState createState() => _ThumbnailViewState();
}

class _ThumbnailViewState extends State<ThumbnailView> {
  List<MediaInfo> mediaList = [];

  @override
  Widget build(BuildContext context) {
//    Thumbnail.addLink(
//      context: context,
//      onLinkAdded: (mediaInfo) {
//        if (mediaInfo != null && mediaInfo.thumbnailUrl.isNotEmpty) {
//          setState(() {
//            mediaList.add(mediaInfo);
//          });
//        }
//      },
//    );

    return mediaList.length > 0 ? MediaListView(
      urls: widget.urls,
    ) : Container();
  }
}
