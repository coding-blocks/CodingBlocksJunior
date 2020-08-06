import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Hello",
                        style: TextStyle(
                          color: getColorFromHex('#1D4479'),
                          fontSize: 14,
                        )),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text("Recommended Course for you!",
                        style: TextStyle(
                          color: getColorFromHex('#1D4479'),
                          fontSize: 14,
                        )),
                  )),
              CourseCard(),
              CourseCard(),
              CourseCard(),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => CoursesViewModel(),
    );
  }
}
