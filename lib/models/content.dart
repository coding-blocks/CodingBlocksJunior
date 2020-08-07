import 'package:cloud_firestore/cloud_firestore.dart';

class Content {
  String type;
  String url;

  Content({
    this.type,
    this.url,
  });

  static Content fromSnapshot(DocumentSnapshot snapshot) {
    return Content(
      type: snapshot['type'],
      url: snapshot['url'],
    );
  }
}