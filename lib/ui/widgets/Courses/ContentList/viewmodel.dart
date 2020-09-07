import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:stacked/stacked.dart';

class ContentListViewModel extends FutureViewModel<List<Content>> {
  Stream<Content> contentStream;
  List<Content> get contents => data ?? [];

  ContentListViewModel({this.contentStream});

  @override
  Future<List<Content>> futureToRun() async{
    final f = await contentStream.toList();
    return f;
  }
}