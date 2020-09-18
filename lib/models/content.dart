import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/index.dart';

class Content extends BaseModel {
  final String id;
  final String title;
  final String type;
  final String url;
  final String thumbnail;
  final Timestamp createdate;
  final bool isLive;
  final Timestamp publishedAt;

  Content(
      {this.id,
      this.type,
      this.url,
      this.title,
      this.thumbnail,
      this.createdate,
      this.isLive,
      this.publishedAt});

  static Content fromSnapshot(DocumentSnapshot snapshot) {
    return Content(
      id: snapshot.documentID,
      title: snapshot['title'],
      type: snapshot['type'],
      url: snapshot['url'],
      thumbnail: snapshot['thumbnail'],
      createdate: snapshot['createdate'],
      isLive: snapshot['isLive'],
      publishedAt: snapshot['published_at'],
    );
  }

  static Future<Content> fromId(String id) async {
    return Content.fromSnapshot(
        await Firestore.instance.collection('contents').document(id).get());
  }
}
