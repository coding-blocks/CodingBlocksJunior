import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  String title;
  String subtitle;
  String logo;

  Course({ 
    this.title, 
    this.subtitle, 
    this.logo 
  });

  static Course fromSnapshot(DocumentSnapshot snapshot) {
    return Course(
      title: snapshot['title'],
      subtitle: snapshot['subtitle'],
      logo: snapshot['logo'],
    );
  }
}