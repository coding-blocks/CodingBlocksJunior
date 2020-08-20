import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String id;
  String classGroup;
  DocumentSnapshot snapshot;

  UserProfile({
    this.id,
    this.classGroup,
    this.snapshot
  });

  static UserProfile fromSnapshot(DocumentSnapshot snapshot) {
    return UserProfile(
      id: snapshot.documentID,
      classGroup: snapshot['classGroup'],
      snapshot: snapshot
    );
  }
}