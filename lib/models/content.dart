import 'package:cloud_firestore/cloud_firestore.dart';

class Content {
  final String id;
  final String title;
  final String type;
  final String url;

  Content({
    this.id,
    this.type,
    this.url,
    this.title
  });

  static Content fromSnapshot(DocumentSnapshot snapshot) {
    return Content(
      id: snapshot.documentID,
      title: snapshot['title'],
      type: snapshot['type'],
      url: snapshot['url'],
    );
  }
}