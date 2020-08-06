import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final text;

  TagChip({ this.text });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: Chip(
        backgroundColor: Colors.transparent,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white),
        ),
        label: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
