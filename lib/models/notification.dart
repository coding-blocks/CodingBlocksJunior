import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class Notification extends BaseModel {
  final String id;
  final String title;
  final String subtitle;
  final String url;
  final Timestamp date;
  final String userId;
  final String classGroup;
  final String courseId;
  final bool everyone;

  Notification({
    this.id,
    this.title,
    this.subtitle,
    this.url,
    this.date,
    this.userId,
    this.classGroup,
    this.courseId,
    this.everyone,
  });

  static Notification fromSnapshot(DocumentSnapshot snapshot) {
    return Notification(
      id: snapshot.documentID,
      title: snapshot['title'],
      subtitle: snapshot['subtitle'],
      url: snapshot['url'],
      date: snapshot['date'],
      userId: snapshot['userId'],
      classGroup: snapshot['classGroup'],
      courseId: snapshot['courseId'],
      everyone: snapshot['everyone'],
    );
  }
}
