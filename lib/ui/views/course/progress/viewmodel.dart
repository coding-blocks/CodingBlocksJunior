import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class ProgressViewModel extends FutureViewModel<int> {
  SessionService sessionService = locator<SessionService>();

  String id;
  bool isSubscribed = false;

  @override
  Future<int> futureToRun() {
    _isCourseSubscribed();
    return fetchCourseProgress(id);
  }

  ProgressViewModel(this.id);

  FirebaseUser get user => sessionService.user;

  get uid => user.uid;

  Future<int> fetchCourseProgress(id) async {
    if (id == null) return null;
    var courseRef = Firestore.instance.collection('courses').document(id);
    var docs = await Firestore.instance
        .collection('user_progress')
        .where("course", isEqualTo: courseRef)
        .where("userId", isEqualTo: uid)
        .limit(1)
        .getDocuments();

    return docs.documents.length > 0
        ? docs.documents[0].data['user_progress']
        : 0;
  }

  _isCourseSubscribed() async {
    if (id == null) return null;
    var docs = await Firestore.instance
        .collection('user_course_subscriptions')
        .where("course", isEqualTo: id)
        .where("userId", isEqualTo: uid)
        .limit(1)
        .getDocuments();

    isSubscribed = docs.documents.length > 0 ? true : false;
  }

  subscribeCourse() async {
    await Firestore.instance.collection('user_course_subscriptions').add({
      'course': id,
      'userId': uid,
      'subscribed_at': FieldValue.serverTimestamp()
    });
    isSubscribed = true;
    notifyListeners();
  }
}
