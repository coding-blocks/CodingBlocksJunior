import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseViewModel extends FutureViewModel<Course> {
  final NavigationService _navigationService = locator<NavigationService>();

  final String slug;
  final Course initialCourseValue;

  @override
  Future<Course> futureToRun() {
    return fetchCourseBySlug(slug);
  }

  CourseViewModel({this.slug, this.initialCourseValue});

  Future<Course> fetchCourseBySlug(slug) async {
    if (initialCourseValue != null) return initialCourseValue;

    if (slug == null) return null;

    var docs = await Firestore.instance
        .collection('courses')
        .where("slug", isEqualTo: slug)
        .limit(1)
        .getDocuments();

    return docs.documents.length > 0
        ? Course.fromSnapshot(docs.documents[0])
        : null;
  }

  void goToContent(Content c) {
    _navigationService.navigateTo(
        Routes.playerView(courseId: this.data.id, contentId: c.id),
        arguments: {
          'content': c,
        });
  }
}
