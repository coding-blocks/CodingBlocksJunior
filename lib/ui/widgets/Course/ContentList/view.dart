import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/ui/widgets/Course/ContentList/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContentListView extends StatelessWidget {
  Stream<QuerySnapshot> contentStream;

  ContentListView ({this.contentStream});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ContentListViewModel(contentStream: contentStream),
      builder: (context, model, child) => ListView.builder(
          itemCount: model.contents.length,
          itemBuilder: (context, index) {
            return Text(model.contents[index].type);
          }
      ),
    );
  }
}
