import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:stacked/stacked.dart';

class DashboardNotesViewModel extends StreamViewModel<QuerySnapshot> {
  SessionService sessionService = locator<SessionService>();
  List<Note> notes = [];
 
  @override
  Stream<QuerySnapshot> get stream => Firestore
    .instance
    .collection('notes')
    .where("userId", isEqualTo: sessionService.user.uid)
    .snapshots();

  @override
  void onData(QuerySnapshot data) {
    notes = data.documents.map((DocumentSnapshot snapshot) => Note.fromSnapshot(snapshot)).toList();
  }
}
