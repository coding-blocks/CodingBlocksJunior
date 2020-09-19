import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;

  final Function onPressed;
  final double width;
  final double height;
  final double cornerRadius;
  Gradient gradient = LinearGradient(
    colors: <Color>[
      getColorFromHex('#0575E6'),
      getColorFromHex('#021B79')
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0]
  );

  get gadientValue => gradient ?? LinearGradient(
      colors: <Color>[
        getColorFromHex('#0575E6'),
        getColorFromHex('#021B79')
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0]
  );

  RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 35.0,
    this.onPressed,
    this.cornerRadius = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * SizeConfig.widthMultiplier,
      height: height * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(gradient: gadientValue, boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ],
          borderRadius: new BorderRadius.circular(cornerRadius)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}