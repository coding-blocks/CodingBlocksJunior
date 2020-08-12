import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NoteListItemViewModel extends FutureViewModel<void> {
  final Note note;
  Course course;
  Content content;

  NoteListItemViewModel({
    @required this.note
  });

  @override
  Future<void> futureToRun() {
    return loadCourseAndContent();
  }

  Future loadCourseAndContent() async {
    final String courseId = note.courseId;
    final String contentId = note.contentId;

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
