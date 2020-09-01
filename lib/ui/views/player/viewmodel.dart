import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerViewModel extends FutureViewModel<Content> {
  final SessionService _sessionService = locator<SessionService>();
  String contentId;
  String courseId;

  YoutubePlayerController ytController;
  Content content;
  Course course;
  Bookmark bookmark;

  DocumentReference courseReference;
  DocumentReference contentReference;

  PlayerViewModel({this.contentId, this.courseId, this.content});

  @override
  Future<Content> futureToRun() async {
    content = await fetchContent();
    setupYoutubePlayer(content.url);
    course = await fetchCourse();
    bookmark = await fetchBookmark();

    courseReference = Firestore
      .instance
      .collection('courses')
      .document(course.id);
    contentReference = Firestore
      .instance
      .collection('contents')
      .document(content.id);

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
        .collection('contents')
        .document(contentId)
        .get();

    return Content.fromSnapshot(qs);
  }
  Future<Bookmark> fetchBookmark() async {
    String courseId = course.id;
    String contentId = content.id;
    DocumentReference contentReference = Firestore
      .instance
      .document("/contents/$contentId");
    DocumentReference courseReference = Firestore
      .instance
      .document("/courses/$courseId");

    var bookmarkSnapshot = await Firestore
      .instance
      .collection('bookmarks')
      .where('content', isEqualTo: contentReference)
      .where('course', isEqualTo: courseReference)
      .getDocuments();

    return bookmarkSnapshot.documents.length > 0 ? Bookmark.fromSnapshot(bookmarkSnapshot.documents[0]) : null;
  }

  Future toggleBookmark() async {
    if (bookmark != null) {
      await Firestore
        .instance
        .collection('bookmarks')
        .document(bookmark.id)
        .delete();
      bookmark = null;
    } else {
      var result = await Firestore
        .instance
        .collection('bookmarks')
        .add({
          'content': contentReference,
          'course': courseReference,
          'userId': _sessionService.user.uid
        });
      var bookmarkSnapshot = await result.get();

      bookmark = Bookmark.fromSnapshot(bookmarkSnapshot);
    }
    notifyListeners();
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
