import 'package:coding_blocks_junior/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CoursePageAppBar extends StatelessWidget {
  final Course course;

  CoursePageAppBar(this.course);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.5,
      child: Container(
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            image: DecorationImage(
                image: NetworkImage(course.background), fit: BoxFit.cover)),
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                course.title,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  new LinearPercentIndicator(
                    width: 150.0,
                    lineHeight: 3.0,
                    percent: 0.1,
                    progressColor: Colors.white,
                  ),
                  Text(
                    "0% Completed",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
