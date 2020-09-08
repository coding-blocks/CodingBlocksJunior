import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/viewmodel.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/CourseCardExpandedView.dart';
import 'package:stacked/stacked.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final Function onPress;
  final bool isExpanded;

  CourseCard({this.course, this.onPress, this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CourseCardViewModel>.nonReactive(
        builder: (BuildContext context, CourseCardViewModel model, w) => Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: model.onPress,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(model.course.background),
                          fit: BoxFit.cover)),
                  padding: getInsetsAll(10),
                  child: Container(
                    margin: SizeConfig.isPortrait
                        ? getInsetsAll(12)
                        : getInsetsAll(4),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 30 * SizeConfig.imageSizeMultiplier,
                                  width: 30 * SizeConfig.imageSizeMultiplier,
                                  margin: getInsetsOnly(right: 10),
                                  child: Image.network(model.course.logo),
                                ),
                                Text(
                                  model.course.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16 * SizeConfig.textMultiplier),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'For Classes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10 * SizeConfig.textMultiplier),
                                ),
                                Text(
                                  '7th - 10th',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10 * SizeConfig.textMultiplier),
                                ),
                              ],
                            ),
                          ],
                        ),
                        AnimatedContainer(
                          height: this.isExpanded ? null : 0,
                          duration: Duration(seconds: 2),
                          child: Padding(
                            padding: getInsetsOnly(top: 8),
                            child: CourseCardExpandedView(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => CourseCardViewModel(
            course: course, onPress: onPress));
  }
}
