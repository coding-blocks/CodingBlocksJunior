import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/CourseCardExpandedView.dart';
import 'package:stacked/stacked.dart';

class CourseCard extends StatelessWidget {
  Course course;
  Function onPress;
  bool isExpanded;

  CourseCard({this.course, this.onPress, this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CourseCardViewModel>.nonReactive(
        builder: (BuildContext context,CourseCardViewModel model, w) => Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          child: InkWell(
            onTap: model.onPress,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(model.course.background),
                      fit: BoxFit.cover
                  )
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Image.network(model.course.logo),
                          ),
                          Text(
                            model.course.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'For Classes',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                          Text(
                            '7th - 10th',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 8),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    height: model.isExpanded ? null : 0,
                    duration: Duration(seconds: 2),
                    child: CourseCardExpandedView(),
                  ),
                ],
              ),
            ),
          ),
        ),
        viewModelBuilder: () => CourseCardViewModel(course: course, onPress: onPress, isExpanded: isExpanded));
  }
}