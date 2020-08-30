import 'dart:math';

import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
}

EdgeInsets getInsetsLTRB (int left, int top, int right, int bottom) {
  return EdgeInsets.fromLTRB(
      left * SizeConfig.widthMultiplier,
      top * SizeConfig.heightMultiplier,
      right * SizeConfig.widthMultiplier,
      bottom * SizeConfig.heightMultiplier
  );
}