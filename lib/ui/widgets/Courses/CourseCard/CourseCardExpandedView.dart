import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/TagChip.dart';

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
                height: 35,
                width: 35,
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: ClipOval(
                  child: SvgPicture.network('https://minio.codingblocks.com/img/avatar-9.svg'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mentor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Prateek Narang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Wrap(
            spacing: 4,
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