import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/CourseCardExpandedView.dart';

class CourseCard extends StatefulWidget {
  final Course course;
  final bool isExpanded;
  final Function onPress;

  CourseCard({Course course, bool isExpanded, Function onPress})
      : this.course = course,
        this.isExpanded = isExpanded ?? false,
        this.onPress = onPress;

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: widget.onPress,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(widget.course.background),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 20 * SizeConfig.imageSizeMultiplier,
                          width: 20 * SizeConfig.imageSizeMultiplier,
                          margin: EdgeInsets.only(
                              right: 10 * SizeConfig.widthMultiplier),
                          child: Image.network(widget.course.logo),
                        ),
                        Text(widget.course.title,
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w700,
                                fontSize: 12 * SizeConfig.textMultiplier,
                                color: Colors.white)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'For Classes',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8 * SizeConfig.textMultiplier),
                        ),
                        Text(
                          '7th - 10th',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8 * SizeConfig.textMultiplier),
                        ),
                      ],
                    ),
                  ],
                ),
                AnimatedContainer(
                  height: widget.isExpanded ? null : 0,
                  duration: Duration(seconds: 2),
                  child: CourseCardExpandedView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
