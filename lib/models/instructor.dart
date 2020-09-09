import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/index.dart';
import 'package:coding_blocks_junior/utils/types.dart';
import 'package:floor/floor.dart';

@entity
class Instructor extends BaseModel {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final FirebaseImage photo;

  Instructor({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.photo,
  });

  static Instructor fromSnapshot(DocumentSnapshot snapshot) {
    return Instructor(
      id: snapshot.documentID,
      firstname: snapshot['firstname'],
      lastname: snapshot['lastname'],
      photo: FirebaseImage.fromDynamicData(snapshot['photo']),
      email: snapshot['email'],
    );
  }
}
