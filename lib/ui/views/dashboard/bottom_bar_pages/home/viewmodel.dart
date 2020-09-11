import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';

class DashboardHomeViewModel extends StreamViewModel<QuerySnapshot> {
  final NavigationService _navigationService = locator<NavigationService>();
  SessionService sessionService = locator<SessionService>();
  int limit = 20;
  List<Course> courses = [];
  String selectedCourseId;

  List<Course> get otherCourses => courses.length > 1 ? courses.sublist(1) : [];

  Stream<QuerySnapshot> get stream =>
      Firestore.instance.collection('courses').limit(limit).snapshots();

  FirebaseUser get user => sessionService.user;

  get name => user.isAnonymous ? 'Anonymous' : user.displayName;
  String classGroup;

  @override
  void onData(QuerySnapshot data) {
    getClassGroup().then((value) {
      courses = data.documents
          .map((DocumentSnapshot snapshot) => Course.fromSnapshot(snapshot))
          .toList()
            ..sort((a, b) => a.audience[0].toString().compareTo(value));
      selectedCourseId = courses[0].id;
    });
  }

  Future<String> getClassGroup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("classGroup") ?? '1st - 4th';
  }

  void goToCourse(Course course) {
    if (course.id == selectedCourseId) {
      _navigationService.navigateTo(Routes.courseView(slug: course.slug));
      return;
    }

    selectedCourseId = course.id;
    notifyListeners();
  }
}
