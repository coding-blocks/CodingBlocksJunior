import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';


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


