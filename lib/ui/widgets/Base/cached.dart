import 'package:flutter/material.dart';

class Cached extends StatefulWidget {
  final Widget child;

  Cached(this.child);

  @override
  _CachedState createState() => _CachedState();
}

class _CachedState extends State<Cached> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
