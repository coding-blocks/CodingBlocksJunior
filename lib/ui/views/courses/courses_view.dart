import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'courses_viewmodel.dart';

class CoursesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoursesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Column(
          children: <Widget>[
            CourseCard(),
            CourseCard(),
            CourseCard(),
          ],
        ),
      ), 
      viewModelBuilder: () => CoursesViewModel(),
    );
  }
}
