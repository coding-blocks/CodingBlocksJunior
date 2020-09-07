import 'dart:math';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

EdgeInsets getInsetsLTRB(left, top, right, bottom) {
  return EdgeInsets.fromLTRB(
      left * SizeConfig.widthMultiplier,
      top * SizeConfig.heightMultiplier,
      right * SizeConfig.widthMultiplier,
      bottom * SizeConfig.heightMultiplier);
}

EdgeInsets getInsetsAll(x) =>
    EdgeInsets.all(x * SizeConfig.imageSizeMultiplier);

EdgeInsets getInsetsOnly({left = 0, right = 0, top = 0, bottom = 0}) =>
    EdgeInsets.only(
        left: left * SizeConfig.widthMultiplier,
        top: top * SizeConfig.heightMultiplier,
        right: right * SizeConfig.widthMultiplier,
        bottom: bottom * SizeConfig.heightMultiplier);