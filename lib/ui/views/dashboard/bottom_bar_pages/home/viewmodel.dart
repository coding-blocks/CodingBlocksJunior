import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/services/local_storage_service.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:coding_blocks_junior/ui/views/course/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';

class DashboardHomeViewModel extends StreamViewModel<QuerySnapshot> {
  final NavigationService _navigationService = locator<NavigationService>();
  SessionService sessionService = locator<SessionService>();
  LocalStorageService localStorageService = locator<LocalStorageService>();

  int limit = 20;
  List<Course> _courses = [];
  String selectedCourseId;

  Stream<QuerySnapshot> get stream =>
      Firestore.instance.collection('courses').limit(limit).snapshots();

  FirebaseUser get user => sessionService.user;

  get name => user.isAnonymous ? 'Anonymous' : user.displayName;
  String classGroup;

  @override
  void onData(QuerySnapshot data) {
    _courses = data.documents
        .map((DocumentSnapshot snapshot) => Course.fromSnapshot(snapshot))
        .toList();
    selectedCourseId = _courses[0].id;
  }

  List<Course> getRecommendedCourses(){
    return _courses.where((course) => course.audience[0] == localStorageService.preferences.getString("classGroup")).toList();
  }

  List<Course> getOtherCourses(){
    return _courses.where((course) => course.audience[0] != localStorageService.preferences.getString("classGroup")).toList();
  }


  void goToCourse(Course course) {
    if (course.id == selectedCourseId) {
      _navigationService.navigateToView(CourseView(initialCourseValue: course));
      // _navigationService.navigateTo(Routes.courseView(slug: course.slug));
      return;
    }
    selectedCourseId = course.id;
    notifyListeners();
  }
}
