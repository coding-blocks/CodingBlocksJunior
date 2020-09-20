import 'package:coding_blocks_junior/ui/views/on_board/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardInterests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: getInsetsOnly(top: SizeConfig.isPortrait ? 60 : 20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/onboarding-3.png'),
                width: 220 * SizeConfig.imageSizeMultiplier,
                height: 205 * SizeConfig.imageSizeMultiplier,
              ),
            ),
            Padding(
              padding: getInsetsOnly(top: 20),
              child: Text('Courses for Class II - XII',
                  style: theme.textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: SizeConfig.isPortrait
                        ? 24 * SizeConfig.textMultiplier
                        : 20 * SizeConfig.textMultiplier,                  )),
            ),
            Padding(
              padding: getInsetsOnly(top: 10, bottom: 40),
              child: Text(
                  'We deliver well researched content across all\ncourses, so that you learn the best.',
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
