import 'package:coding_blocks_junior/models/instructor.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/viewmodel.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/TagChip.dart';
import 'package:stacked/stacked.dart';

class CourseCardExpandedView extends ViewModelWidget<CourseCardViewModel> {
  @override
  Widget build(BuildContext context, CourseCardViewModel model) {
    return  Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Container(
                height: 35,
                width: 35,
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: ClipOval(
                  child: Image.network('https://www.arslan.mn/files/users/sample.png'),
                ),
              ),
              EnhancedFutureBuilder(
                rememberFutureResult: false,
                future: model.course.instructorsFuture,
                whenDone: (List<Instructor> instructors) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mentor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    ...instructors.map((Instructor i) => Text(
                        i.firstname,
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                whenWaiting: CircularProgressIndicator(),
                whenNotDone: Container(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Wrap(
            spacing: -5,
            runSpacing: 2,
            children: <Widget>[
              TagChip(text: 'Tag 1'),
              TagChip(text: 'Tag 1'),
              TagChip(text: 'Tag 1'),
              TagChip(text: 'Tag 1'),
            ],
          ),
        ),
      ],
    );
  }
}