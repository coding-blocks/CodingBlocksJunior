import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/viewmodels/reloadable_future_viewmodel.dart';
import 'package:flutter/material.dart';

class PlayerNotesViewModel extends ReloadableFutureViewModel<List<Note>> {
  final Course course;
  final Content content;

  PlayerNotesViewModel({
    @required this.course, 
    @required this.content
  });

  @override
  Future<List<Note>> futureToRun() async {
    final String courseId = course.id;
    final String contentId = content.id;
    print("course: " + contentId);

    var courseReference = Firestore
      .instance
      .collection('courses')
      .document(courseId);
    var contentReference = courseReference
      .collection('contents')
      .document(contentId);

    var notesSnapshot = await Firestore
      .instance
      .collection('notes')
      .where('content', isEqualTo: contentReference)
      .getDocuments();
    return notesSnapshot.documents.map((snapshot) => Note.fromSnapshot(snapshot)).toList();
  }

  Future addSampleNote() async {
    // TODO
  }
}
