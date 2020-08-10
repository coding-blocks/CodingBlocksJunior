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
      height: height,
      width: width,
      child: Image.asset(asset),
    );
  }
}
