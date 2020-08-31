import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class AssetIcon extends StatelessWidget {
  final String asset;
  final double height;
  final double width;

  AssetIcon({
    this.asset,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * SizeConfig.imageSizeMultiplier,
      width: width * SizeConfig.imageSizeMultiplier,
      child: Image.asset(asset),
    );
  }
}
