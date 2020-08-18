import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:stacked/stacked.dart';

class DashboardBookmarksViewModel extends StreamViewModel<QuerySnapshot> {
  List<Bookmark> bookmarks;

  @override
  Stream<QuerySnapshot> get stream => Firestore
    .instance
    .collection('bookmarks')
    .snapshots();

  @override
  void onData(QuerySnapshot data) {
    bookmarks = data.documents.map((DocumentSnapshot snapshot) => Bookmark.fromSnapshot(snapshot)).toList();
  }
}
