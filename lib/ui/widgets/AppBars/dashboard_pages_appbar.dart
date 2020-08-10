import 'package:flutter/material.dart';

class DashboardPagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  DashboardPagesAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [],
      flexibleSpace: Image(
        image: AssetImage('assets/app-bar-background.png'),
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
