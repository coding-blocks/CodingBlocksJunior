import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String title;
  final String subtitle;
  final String background;
  final String logo;
  final String slug;
  final String id;
  final List<dynamic> contents;

  Course({
    this.id,
    this.title,
    this.subtitle,
    this.logo,
    this.background,
    this.slug,
    this.contents
  });

  static Course fromSnapshot(DocumentSnapshot snapshot) {
    return Course(
      id: snapshot.documentID,
      title: snapshot['title'],
      subtitle: snapshot['subtitle'],
      logo: snapshot['logo']['src'],
      background: snapshot['background']['src'],
      slug: snapshot['slug'],
      contents: snapshot['contents']
    );
  }

  Stream<QuerySnapshot> get contentStream => Firestore.instance
      .collection('contents')
      .where(FieldPath.documentId, whereIn: this.contents)
      .snapshots();

  Stream<DocumentSnapshot> get courseStream => Firestore.instance
      .collection('courses')
      .document(id)
      .snapshots();
}
