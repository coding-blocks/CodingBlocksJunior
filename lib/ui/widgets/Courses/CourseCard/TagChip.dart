import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final text;

  TagChip({this.text});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: Transform(
        transform: new Matrix4.identity()..scale(0.8),
        child: Chip(
          backgroundColor: Colors.transparent,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          labelPadding: getInsetsLTRB(20, 0, 20, 0),
          shape: StadiumBorder(
            side: BorderSide(color: getColorFromHex('#83D3C5')),
          ),
          label: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8 * SizeConfig.textMultiplier,
            ),
          ),
        ),
      ),
    );
  }
}
