import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/progress.dart';
import 'package:coding_blocks_junior/services/store.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerViewModel extends FutureViewModel<Content> {
  StoreService _storeService = locator<StoreService>();

  String contentId;
  String courseId;

  YoutubePlayerController ytController;
  Content content;
  Course course;
  PlayerViewModel({this.contentId, this.courseId, this.content});

  @override
  Future<Content> futureToRun() async {
    content = await fetchContent();
    setupYoutubePlayer(content.url);
    updateProgress();
    course = await fetchCourse();
    return content;
  }

  Future<Course> fetchCourse() async {
    var docs = await Firestore
      .instance
      .collection('courses')
      .where(FieldPath.documentId, isEqualTo: courseId)
      .getDocuments();

    return Course.fromSnapshot(docs.documents[0]);
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

  void updateProgress() {
    _storeService.database.progressDao.insert(Progress(
        contentId: content.id,
        courseId: courseId
    ));
  }
}
