import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:stacked/stacked.dart';

class DashboardBookmarksViewModel extends FutureViewModel<List<Bookmark>> {
  @override
  Future<List<Bookmark>> futureToRun() async {
    var bookmarksSnapshot = await Firestore
      .instance
      .collection('bookmarks')
      .getDocuments();
    
    return bookmarksSnapshot.documents.map((snapshot) => Bookmark.fromSnapshot(snapshot)).toList();
  }
}
