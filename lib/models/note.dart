import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floor/floor.dart';

@entity
class Note {
  final String id;
  final String text;
  final Timestamp createdAt;
  final String contentId;
  final String courseId;
  final DocumentReference content;
  final DocumentReference course;

  Note({
    this.id, 
    this.text,
    this.createdAt,
    this.contentId,
    this.courseId,
    this.content,
    this.course
  });

  static Note fromSnapshot(DocumentSnapshot snapshot) {
    return Note(
      id: snapshot.documentID,
      text: snapshot['text'],
      createdAt: snapshot['createdAt'],
      contentId: snapshot['content'].documentID,
      courseId: snapshot['course'].documentID,
    );
  }
}
