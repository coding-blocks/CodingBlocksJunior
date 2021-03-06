import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class BottomBarNavIcon extends StatelessWidget {
  final asset;

  BottomBarNavIcon( this.asset );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21 * SizeConfig.imageSizeMultiplier,
      width: 21 * SizeConfig.imageSizeMultiplier,
      child: Image.asset(asset),
    );
  }
}
