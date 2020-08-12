import 'package:coding_blocks_junior/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget {
  final Course course;

  RoundedAppBar(this.course);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: <Widget>[
          Text(
            course.title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
