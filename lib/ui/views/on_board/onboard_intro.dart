import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';

class OnboardIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: getInsetsOnly(top: 60),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/onboarding-1.png'),
                width: 220 * SizeConfig.imageSizeMultiplier,
                height: 205 * SizeConfig.imageSizeMultiplier,
              ),
            ),
            Padding(
              padding: getInsetsOnly(top: 20),
              child: Text('Free coding classes',
                  style: theme.textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: 24 * SizeConfig.textMultiplier,
                  )),
            ),
            Padding(
              padding: getInsetsOnly(top: 10, bottom: 40),
              child: Text(
                  'All our courses are FREE for everyone and we\nwant all school students to benefit from it.',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14 * SizeConfig.textMultiplier)),
            ),
          ],
        ),
      ),
    );
  }
}
