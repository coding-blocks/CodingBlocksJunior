import 'package:flutter/material.dart';
import 'package:coding_blocks_junior/utils/youtube.dart';

class Thumbnail extends StatelessWidget {
  final String url;

  Thumbnail({
    this.url
  });

  @override
  Widget build(BuildContext context) {
    var videoId = videoIdFromUrl(url);
    final imgUrl = "https://img.youtube.com/vi/$videoId/mqdefault.jpg";
    return Image.network(imgUrl, fit: BoxFit.fitWidth);
  }
}
