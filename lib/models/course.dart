import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  String title;
  String subtitle;
  String logo;
  String slug;
  String id;

  Course({
    this.id,
    this.title,
    this.subtitle,
    this.logo,
    this.slug,
  });

  static Course fromSnapshot(DocumentSnapshot snapshot) {
    return Course(
      id: snapshot.documentID,
      title: snapshot['title'],
      subtitle: snapshot['subtitle'],
      logo: snapshot['logo'],
      slug: snapshot['slug'],
    );
  }

  Stream<QuerySnapshot> get contentStream => Firestore.instance
      .collection('courses')
      .document(id)
      .collection('contents')
      .snapshots();
}
