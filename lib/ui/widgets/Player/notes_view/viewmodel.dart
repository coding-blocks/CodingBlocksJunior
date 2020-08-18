import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:coding_blocks_junior/viewmodels/reloadable_future_viewmodel.dart';
import 'package:flutter/material.dart';

class PlayerNotesViewModel extends ReloadableFutureViewModel<List<Note>> {
  final SessionService _sessionService = locator<SessionService>();
  final Course course;
  final Content content;

  DocumentReference courseReference;
  DocumentReference contentReference;

  PlayerNotesViewModel({
    @required this.course, 
    @required this.content
  }) {
    courseReference = Firestore
      .instance
      .collection('courses')
      .document(course.id);
    contentReference = courseReference
      .collection('contents')
      .document(content.id);
  }

  @override
  Future<List<Note>> futureToRun() async {
    var notesSnapshot = await Firestore
      .instance
      .collection('notes')
      .where('content', isEqualTo: contentReference)
      .getDocuments();
    return notesSnapshot.documents.map((snapshot) => Note.fromSnapshot(snapshot)).toList();
  }

  Future addSampleNote() {
    return Firestore
      .instance
      .collection('notes')
      .add({
        'text': 'Sample todo',
        'course': courseReference,
        'content': contentReference,
        'userId': _sessionService.user.uid
      })
      .then((value) {
        loadData();
      });
  }
}