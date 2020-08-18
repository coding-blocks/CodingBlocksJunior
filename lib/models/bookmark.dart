import 'package:cloud_firestore/cloud_firestore.dart';

class Bookmark {
  final String id;
  final String contentId;
  final String courseId;

  Bookmark({
    this.id, 
    this.contentId,
    this.courseId
  });

  static Bookmark fromSnapshot(DocumentSnapshot snapshot) {
    return Bookmark(
      id: snapshot.documentID,
      contentId: snapshot['content'].documentID,
      courseId: snapshot['course'].documentID
    );
  }
}
