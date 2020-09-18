import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:stacked/stacked.dart';

class ContentListViewModel extends BaseViewModel {
  final Stream<Content> contentStream;
  List<Content> contents = [];

  ContentListViewModel({this.contentStream}) {
    contentStream.listen((content) {
      contents.add(content);
      notifyListeners();
    });
  }

}