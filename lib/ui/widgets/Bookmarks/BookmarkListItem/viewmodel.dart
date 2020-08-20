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
      .document(courseId).get();

    course = Course.fromSnapshot(courseDoc);

    var contentDoc = await Firestore.instance
        .collection('contents')
        .document(contentId).get();

    content = Content.fromSnapshot(contentDoc);
  }
}