import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:stacked/stacked.dart';

class CourseViewModel extends FutureViewModel<Course> {
  String slug;
  @override
  Future<Course> futureToRun() {
    return fetchCourseBySlug(slug);
  }

  CourseViewModel(slug) {
    this.slug = slug;
  }

  Future<Course> fetchCourseBySlug(slug) async {
    if (slug == null)
      return null;

    var docs = await Firestore
        .instance
        .collection('courses')
        .where("slug", isEqualTo: slug)
        .limit(1)
        .getDocuments();

    return docs.documents.length > 0 ? Course.fromSnapshot(docs.documents[0]) : null;
  }
}

