import 'package:cloud_firestore/cloud_firestore.dart';

class Content {
  String title;
  String type;
  String url;

  Content({
    this.type,
    this.url,
    this.title
  });

  static Content fromSnapshot(DocumentSnapshot snapshot) {
    return Content(
      title: snapshot['title'],
      type: snapshot['type'],
      url: snapshot['url'],
    );
  }
}