import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'HexToColor.dart';


SnackBar snackBarFromText(String s) => SnackBar(content: Text(s, style: TextStyle(
  fontSize: 14* SizeConfig.imageSizeMultiplier
)));

Widget If(bool condition, Function w) => condition ? w() : Container();

Widget confirmDialog({
  Text heading,
  Text description,
  Text confirmButtonText,
  Text cancelButtonText,
  Function cancelAction,
  Function confirmAction,
}) => AlertDialog(
  title: heading,
  content: description,
  actions: [
    FlatButton(
      child: cancelButtonText,
      onPressed: cancelAction,
    ),
    FlatButton(
      child: confirmButtonText,
      onPressed: confirmAction,
    )
  ],
);


Widget AsyncButton ({child, Future Function() onTap, color = const Color(0xff194A88)}) {
  final _btnController = new RoundedLoadingButtonController();

  onPressed () async {
    try {
      await onTap();
      _btnController.success();
    } catch (e) {
      _btnController.reset();
    }
  }

  return RoundedLoadingButton(
    color: color,
    child: child,
    controller: _btnController,
    onPressed: onPressed,
  );
}