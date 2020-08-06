import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';


class CoursesViewModel extends StreamViewModel<QuerySnapshot> {
  int limit  = 20;

  @override
  Stream<QuerySnapshot> get stream => Firestore
      .instance
      .collection('courses')
      .limit(limit)
      .snapshots();

}
