import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:stacked/stacked.dart';

class DashboardNotesViewModel extends FutureViewModel<List<Note>> {
  @override
  Future<List<Note>> futureToRun() async {
    var notesSnapshot = await Firestore
      .instance
      .collection('notes')
      .getDocuments();
    return notesSnapshot.documents.map((snapshot) => Note.fromSnapshot(snapshot)).toList();
  }
}
