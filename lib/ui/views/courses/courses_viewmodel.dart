import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:stacked/stacked.dart';


class CoursesViewModel extends StreamViewModel<QuerySnapshot> {
  int limit = 20;
  List<Course> courses = [];

  @override
  Stream<QuerySnapshot> get stream => Firestore
    .instance
    .collection('courses')
    .limit(limit)
    .snapshots();

  @override 
  void onData(QuerySnapshot data) {
    courses = data.documents.map((DocumentSnapshot snapshot) => Course.fromSnapshot(snapshot)).toList();
  }
}
