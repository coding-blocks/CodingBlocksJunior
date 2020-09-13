import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/CourseCardExpandedView.dart';
import 'package:stacked/stacked.dart';

class CourseCard extends StatefulWidget{
  final Course course;
  final Function onPress;
  final bool isExpanded;

  CourseCard({this.course, this.onPress, this.isExpanded});

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CourseCardViewModel>.nonReactive(
        builder: (BuildContext context, CourseCardViewModel model, w) => Container(
          padding: getInsetsOnly(left: 28, right: 28, bottom: 15),
          child: Card(
                // elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  onTap: model.onPress,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [BoxShadow(
                            color: getColorFromHex(model.course.themeColor).withAlpha(100),
                            blurRadius: 5,
                            spreadRadius: 1,
                          offset: Offset(0,5)
                        )],
                        image: DecorationImage(
                            image: NetworkImage(model.course.background),
                            fit: BoxFit.cover)),
                    child: Container(
                      margin: SizeConfig.isPortrait
                          ? getInsetsAll(22)
                          : getInsetsAll(14),
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
                                    model.course.audience[0],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10 * SizeConfig.textMultiplier),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        AnimatedSize(
                          vsync: this,
                          curve: Curves.ease,
                          duration: Duration(milliseconds: 200),
                          child: Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            visible: this.widget.isExpanded,
                            child: Padding(
                              padding: getInsetsOnly(top: 8),
                              child: CourseCardExpandedView(),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
        ),
        viewModelBuilder: () => CourseCardViewModel(
            course: widget.course, onPress: widget.onPress));
  }
}
