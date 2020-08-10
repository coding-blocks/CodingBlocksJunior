import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String title;
  final String subtitle;
  final String background;
  final String logo;
  final String slug;
  final String id;

  Course({
    this.id,
    this.title,
    this.subtitle,
    this.logo,
    this.background,
    this.slug,
  });

  static Course fromSnapshot(DocumentSnapshot snapshot) {
    return Course(
      id: snapshot.documentID,
      title: snapshot['title'],
      subtitle: snapshot['subtitle'],
      logo: snapshot['logo'],
      background: snapshot['background'],
      slug: snapshot['slug'],
    );
  }

  Stream<QuerySnapshot> get contentStream => Firestore.instance
      .collection('courses')
      .document(id)
      .collection('contents')
      .snapshots();
}
