import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class NavLabelText extends StatelessWidget {
  final text;

  NavLabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 2.0 * SizeConfig.textMultiplier,
        color: getColorFromHex('#056FDE'),
      ),
    );
  }
}
