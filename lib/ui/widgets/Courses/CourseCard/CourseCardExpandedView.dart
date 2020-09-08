import 'package:coding_blocks_junior/models/instructor.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/viewmodel.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/TagChip.dart';
import 'package:stacked/stacked.dart';

class CourseCardExpandedView extends ViewModelWidget<CourseCardViewModel> {
  @override
  Widget build(BuildContext context, CourseCardViewModel model) {
    final _theme = Theme.of(context);
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: EnhancedFutureBuilder(
            rememberFutureResult: false,
            future: model.course.instructorsFuture,
            whenDone: (List<Instructor> instructors) => Row(
              children: <Widget>[
                Container(
                  height: 35 * SizeConfig.imageSizeMultiplier,
                  width: 35 * SizeConfig.imageSizeMultiplier,
                  margin: getInsetsLTRB(0, 0, 10, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                  child: ClipOval(
                    child: Image.network(instructors[0].photo.src),
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: 'Mentors\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12 * SizeConfig.textMultiplier,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                        text: instructors.map((e) => e.firstname).join(", "),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
              ],
            ),
            whenWaiting: Container(),
            whenNotDone: Container(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: -10 * SizeConfig.widthMultiplier,
            runSpacing: 2,
            children: <Widget>[
              TagChip(text: 'Tag 1'),
              TagChip(text: 'Tag 1'),
              TagChip(text: 'Bigger tag 1'),
            ],
          ),
        ),
      ],
    );
  }
}
