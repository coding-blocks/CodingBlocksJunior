import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerViewModel extends FutureViewModel<Content> {
  String contentId;
  String courseId;

  YoutubePlayerController ytController;
  Content content;
  Course course;
  Bookmark bookmark;
  PlayerViewModel({this.contentId, this.courseId, this.content});

  @override
  Future<Content> futureToRun() async {
    content = await fetchContent();
    setupYoutubePlayer(content.url);
    course = await fetchCourse();
    bookmark = await fetchBookmark();
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
  Future<Content> fetchContent() async {
    if (content != null)
      return content;

    var qs = await Firestore.instance
        .collectionGroup('contents')
        .where(FieldPath.documentId, isEqualTo: "courses/$courseId/contents/$contentId")
        .limit(1)
        .getDocuments();

    return Content.fromSnapshot(qs.documents[0]);
  }
  Future<Bookmark> fetchBookmark() async {
    String courseId = course.id;
    String contentId = content.id;
    DocumentReference contentReference = Firestore
      .instance
      .document("/courses/$courseId/contents/$contentId");

    var bookmarkSnapshot = await Firestore
      .instance
      .collection('bookmarks')
      .where('content', isEqualTo: contentReference)
      .getDocuments();

    return bookmarkSnapshot.documents.length > 0 ? Bookmark.fromSnapshot(bookmarkSnapshot.documents[0]) : null;
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
