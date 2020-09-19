import 'package:coding_blocks_junior/models/radio.dart';
import 'package:coding_blocks_junior/ui/views/on_board/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/ClassPill.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';

class OnboardAgeGroup extends ViewModelWidget<OnBoardViewModel> {

  @override
  Widget build(BuildContext context, OnBoardViewModel model) {
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
                image: AssetImage('assets/onboarding-2.png'),
                width: 220 * SizeConfig.imageSizeMultiplier,
                height: 205 * SizeConfig.imageSizeMultiplier,
              ),
            ),
            Padding(
              padding: getInsetsOnly(top: 20),
              child: Text('Top mentors & pedagogy',
                  style: theme.textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: 24 * SizeConfig.textMultiplier,
                  )),
            ),
            Padding(
              padding: getInsetsOnly(top: 10, bottom: 40),
              child: Text(
                  'Our mentors are Geek level coders & from\nTop Tech schools like IITs, IIITs, DTU, NSIT etc.',
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

