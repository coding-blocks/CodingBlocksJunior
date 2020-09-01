import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CoursePageAppBar extends StatelessWidget {
  final Course course;

  CoursePageAppBar(this.course);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          image: DecorationImage(
              image: NetworkImage(course.background), fit: BoxFit.cover)),
      padding: getInsetsAll(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: getInsetsOnly(top: 10.0),
            child: Text(
              course.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18 * SizeConfig.textMultiplier),
            ),
          ),
          Container(
            margin: getInsetsOnly(top: 10.0),
            child: Row(
              children: <Widget>[
                new LinearPercentIndicator(
                  width: 150.0 * SizeConfig.imageSizeMultiplier,
                  lineHeight: 3.0 * SizeConfig.heightMultiplier,
                  percent: 0.0,
                  progressColor: Colors.white,
                ),
                Text(
                  "0% Completed",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10 * SizeConfig.textMultiplier),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
