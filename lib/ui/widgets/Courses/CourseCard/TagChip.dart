import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final text;

  TagChip({ this.text });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: Transform(
        transform: new Matrix4.identity()..scale(0.8),
        child: Chip(
          backgroundColor: Colors.transparent,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          labelPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          shape: StadiumBorder(
            side: BorderSide(color: Colors.white),
          ),
          label: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
          ),
        ),
      ),
    );
  }
}
