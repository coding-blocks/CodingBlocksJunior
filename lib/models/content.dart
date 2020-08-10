import 'package:cloud_firestore/cloud_firestore.dart';

class Content {
  String id;
  String title;
  String type;
  String url;

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