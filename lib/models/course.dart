import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/index.dart';
import 'package:coding_blocks_junior/models/instructor.dart';
import 'package:coding_blocks_junior/utils/firebase.dart';
import 'content.dart';

class Course extends BaseModel {
  final String title;
  final String subtitle;
  final String background;
  final String logo;
  final String slug;
  final String id;
  final String themeColor;
  final List<dynamic> contents;
  final List<dynamic> instructorIds;
  final List<dynamic> audience;
  final List<dynamic> tags;


  Course({
    this.id,
    this.title,
    this.subtitle,
    this.logo,
    this.background,
    this.slug,
    this.themeColor,
    this.contents,
    this.instructorIds,
    this.audience,
    this.tags = const []
  });

  static Course fromSnapshot(DocumentSnapshot snapshot) {
    return Course(
      id: snapshot.documentID,
      title: snapshot['title'],
      subtitle: snapshot['subtitle'],
      logo: snapshot['logo']['src'],
      background: snapshot['background']['src'],
      slug: snapshot['slug'],
      themeColor: snapshot['theme_color'],
      contents: snapshot['contents'],
      instructorIds: snapshot['instructorIds'],
      audience: snapshot['audience'],
      tags: snapshot['tags'],
    );
  }

  Stream<Content> get contentStream {
    return FirebaseReferenceArray<Content>(
      array: this.contents,
      collectionName: 'contents',
      builder: (e) => Content.fromSnapshot(e)
    ).dataStream;
  }

  Stream<DocumentSnapshot> get courseStream => Firestore.instance
      .collection('courses')
      .document(id)
      .snapshots();


  Future<List<Instructor>> get instructorsFuture async => (await Firestore
      .instance
      .collection('Instructors')
      .where(FieldPath.documentId, whereIn: this.instructorIds)
      .getDocuments())
      .documents
      .toList()
      .map( (i) => Instructor.fromSnapshot(i))
      .toList();

}
