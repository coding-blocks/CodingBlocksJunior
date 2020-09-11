import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';

class ClassPill extends StatelessWidget {
  final String klass;
  final Color color;

  ClassPill({@required this.klass, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      padding: getInsetsLTRB(8, 4, 8, 4),
      child: Text(klass),
    );
  }
}