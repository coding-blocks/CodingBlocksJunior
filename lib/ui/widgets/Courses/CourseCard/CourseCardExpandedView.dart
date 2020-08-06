import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/TagChip.dart';
import 'package:flutter/material.dart';

class CourseCardExpandedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mentor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                    Text(
                      'Prateek Narang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Wrap(
            spacing: -5,
            runSpacing: 2,
            children: <Widget>[
              TagChip(text: 'Tag 1'),
              TagChip(text: 'Tag 1'),
              TagChip(text: 'Tag 1'),
              TagChip(text: 'Tag 1'),
            ],
          ),
        ),
      ],
    );
  }
}