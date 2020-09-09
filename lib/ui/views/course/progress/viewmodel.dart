import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer' as developer;

class ProgressViewModel extends FutureViewModel<int> {
  SessionService sessionService = locator<SessionService>();

  String id;
  @override
  Future<int> futureToRun() {
    return fetchCourseProgress(id);
  }

  ProgressViewModel(id) {
    this.id = id;
  }

  FirebaseUser get user => sessionService.user;
  get uid => user.uid;

  Future<int> fetchCourseProgress(id) async {
    if (id == null)
      return null;

    var docs = await Firestore
        .instance
        .collection('user_progress')
        .where("course", isEqualTo: id)
        .where("userId", isEqualTo: uid)
        .limit(1)
        .getDocuments();

    developer.log('log me 1', name: docs.documents.toString());
    return docs.documents.length > 0 ? docs.documents[0].data['user_progress'] : null;
  }

}

