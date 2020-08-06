import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'courses_viewmodel.dart';

class CoursesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoursesViewModel>.reactive(
      builder: (context, model, child) {
        if (model.data ==  null)
          return Text('Loading..');

        return Scaffold(
          body: Column(
            children: (model.data.documents.map<Widget>((d) => Text(d['title']))).toList()
          )
        );
    },
      viewModelBuilder: () => CoursesViewModel(),
    );
  }
}
