import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/index.dart';

class UserProfile extends BaseModel{
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