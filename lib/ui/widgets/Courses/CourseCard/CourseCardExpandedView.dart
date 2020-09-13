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
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: EnhancedFutureBuilder(
            rememberFutureResult: true,
            future: model.course.instructorStream.toList(),
            whenDone: (List<Instructor> instructors) => Row(
              children: <Widget>[
                Container(
                  height: 35 * SizeConfig.imageSizeMultiplier,
                  width: 35 * SizeConfig.imageSizeMultiplier,
                  margin: getInsetsLTRB(0, 0, 10, 0),
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
            children: List.generate(
                model.course.tags != null ? model.course.tags.length : 0,
                (index) => TagChip(text: model.course.tags[index])),
          ),
        ),
      ],
    );
  }
}
