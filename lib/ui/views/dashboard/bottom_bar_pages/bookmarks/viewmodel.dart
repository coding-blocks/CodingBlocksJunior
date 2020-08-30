import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:stacked/stacked.dart';

class DashboardBookmarksViewModel extends StreamViewModel<QuerySnapshot> {
  SessionService sessionService = locator<SessionService>();
  List<Bookmark> bookmarks = [];

  @override
  Stream<QuerySnapshot> get stream => Firestore
    .instance
    .collection('bookmarks')
    .where("userId", isEqualTo: sessionService.user.uid)
    .snapshots();

  @override
  void onData(QuerySnapshot data) {
    bookmarks = data.documents.map((DocumentSnapshot snapshot) => Bookmark.fromSnapshot(snapshot)).toList();
  }
}
