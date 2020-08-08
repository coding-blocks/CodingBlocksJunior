import 'package:flutter/material.dart';

class BottomBarNavIcon extends StatelessWidget {
  final asset;

  BottomBarNavIcon( this.asset );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      child: Image.asset(asset),
    );
  }
}
