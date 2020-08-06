import 'package:coding_blocks_junior/models/course.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/CourseCardExpandedView.dart';

class CourseCard extends StatefulWidget {
  final Course course;
  final bool isExpanded;
  final Function onPress;

  var nullReturn = () => null;

  CourseCard({ 
    Course course, 
    bool isExpanded,  
    Function onPress
  }) : this.course = course, this.isExpanded = isExpanded ?? false, this.onPress = onPress;

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(5, 117, 230, 1),
      child: InkWell(
        onTap: widget.onPress,
        child: Padding(
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
                        child: Image.network(widget.course.logo),
                      ),
                      Text(
                        widget.course.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
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
                          fontSize: 8
                        ),
                      ),
                      Text(
                        '7th - 10th',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8
                        ),
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
    );
  }
}
