import 'package:flutter/material.dart';

SnackBar snackBarFromText(String s) => SnackBar(content: Text(s),);

Widget If(bool condition, Function w) => condition ? w() : Container();