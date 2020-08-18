import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BookmarkListItemViewModel extends FutureViewModel<void> {
  final Bookmark bookmark;
  Course course;
  Content content;

  BookmarkListItemViewModel({
    @required this.bookmark
  });

  @override
  Future<void> futureToRun() {
    return loadContentAndCourse();
  }

  Future loadContentAndCourse() async {
    final String courseId = bookmark.courseId;
    final String contentId = bookmark.contentId;

    var courseDoc = await Firestore
      .instance
      .collection('courses')
      .where(FieldPath.documentId, isEqualTo: courseId)
      .getDocuments();

    course = Course.fromSnapshot(courseDoc.documents[0]);

    var contentDoc = await Firestore.instance
        .collectionGroup('contents')
        .where(FieldPath.documentId, isEqualTo: "courses/$courseId/contents/$contentId")
        .limit(1)
        .getDocuments();

    content = Content.fromSnapshot(contentDoc.documents[0]);
  }
}