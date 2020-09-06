import 'package:cloud_firestore/cloud_firestore.dart';

class Content {
  final String id;
  final String title;
  final String type;
  final String url;
  final String thumbnail;

  Content({
    this.id,
    this.type,
    this.url,
    this.title,
    this.thumbnail
  });

  static Content fromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot);
    return Content(
      id: snapshot.documentID,
      title: snapshot['title'],
      type: snapshot['type'],
      url: snapshot['url'],
      thumbnail: snapshot['thumbnail']
    );
  }

  static Future<Content> fromId(String id) async {
    return Content.fromSnapshot(await Firestore.instance
        .collection('contents')
        .document(id).get());
  }
}