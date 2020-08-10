import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerViewModel extends FutureViewModel<Content> {
  String contentId;
  String courseId;

  YoutubePlayerController ytController;
  Content content;
  PlayerViewModel({this.contentId, this.courseId});

  @override
  Future<Content> futureToRun() async {
    try {
      var qs = await Firestore.instance
          .collectionGroup('contents')
          .where(FieldPath.documentId, isEqualTo: "courses/$courseId/contents/$contentId")
          .limit(1)
          .getDocuments();


      print(qs.documents[0]);


      final content = Content.fromSnapshot(qs.documents[0]);
      print(content.id);
      setupYoutubePlayer(content.url);
      return content;
    } catch (e) {
      print (e);
    }
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
