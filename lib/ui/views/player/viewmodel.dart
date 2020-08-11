import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerViewModel extends FutureViewModel<Content> {
  String contentId;
  String courseId;

  YoutubePlayerController ytController;
  Content content;
  PlayerViewModel({this.contentId, this.courseId, this.content});

  @override
  Future<Content> futureToRun() async {
    content = await fetchContent();
    setupYoutubePlayer(content.url);
    return content;
  }

  Future<Content> fetchContent () async {
    if (content != null)
      return content;

    var qs = await Firestore.instance
        .collectionGroup('contents')
        .where(FieldPath.documentId, isEqualTo: "courses/$courseId/contents/$contentId")
        .limit(1)
        .getDocuments();

    return Content.fromSnapshot(qs.documents[0]);
  }

  setupYoutubePlayer(url) {
    this.ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url),
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
  }
}
