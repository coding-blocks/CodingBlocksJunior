import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:coding_blocks_junior/viewmodels/reloadable_future_viewmodel.dart';
import 'package:flutter/material.dart';

class PlayerNotesViewModel extends ReloadableFutureViewModel<List<Note>> {
  @override
  Future initialise() async {
    super.initialise();
    markProgress();
  }

  final SessionService _sessionService = locator<SessionService>();
  final Course course;
  final Content content;

  DocumentReference courseReference;
  DocumentReference contentReference;
  DocumentReference progressReference;

  PlayerNotesViewModel({@required this.course, @required this.content}) {
    courseReference =
        Firestore.instance.collection('courses').document(course.id);
    contentReference =
        Firestore.instance.collection('contents').document(content.id);
  }

  @override
  Future<List<Note>> futureToRun() async {
    var notesSnapshot = await Firestore.instance
        .collection('notes')
        .where('content', isEqualTo: contentReference)
        .where('userId', isEqualTo: _sessionService.user.uid)
        .getDocuments();

    return notesSnapshot.documents.isNotEmpty
        ? notesSnapshot.documents
            .map((snapshot) => Note.fromSnapshot(snapshot))
            .toList()
        : [];
  }

  Future addNote(String text) {
    return Firestore.instance.collection('notes').add({
      'text': text,
      'course': courseReference,
      'content': contentReference,
      'userId': _sessionService.user.uid
    }).then((value) {
      loadData();
    });
  }

  Future markProgress() async {
    var progress = await Firestore.instance
        .collection('progresses')
        .where('content', isEqualTo: contentReference)
        .where('userId', isEqualTo: _sessionService.user.uid)
        .getDocuments();
    if (progress.documents.length == 0)
      Firestore.instance.collection('progresses').add({
        'course': courseReference,
        'content': contentReference,
        'userId': _sessionService.user.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });
  }
}
