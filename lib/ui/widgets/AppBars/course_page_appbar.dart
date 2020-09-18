import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/ui/views/course/progress/viewmodel.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';

class CoursePageAppBar extends StatelessWidget {
  final Course course;

  CoursePageAppBar(this.course);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProgressViewModel>.reactive(
      builder:(context, model, child) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            image: DecorationImage(
                image: NetworkImage(course.background), fit: BoxFit.cover)),
        padding: getInsetsLTRB(20, 30, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: getInsetsOnly(top: 10.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 20.0 * SizeConfig.imageSizeMultiplier,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: getInsetsOnly(left: 8),
                    child: Text(
                      course.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18 * SizeConfig.textMultiplier),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: getInsetsOnly(top: 10.0),
              child: Row(
                children: <Widget>[
                  new LinearPercentIndicator(
                    width: 200.0 * SizeConfig.imageSizeMultiplier,
                    lineHeight: 7.0 * SizeConfig.heightMultiplier,
                    percent: model.isBusy ? 0 : model.data.toDouble()/100,
                    progressColor: Colors.white,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
                  ),
                  Text(
                    "${model.isBusy ? 0 : model.data}% Completed",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14 * SizeConfig.textMultiplier),
                  )
                ],
              ),
            )
          ],
        ),
      ),
        viewModelBuilder: () => ProgressViewModel(course.id)
    );
  }
}
