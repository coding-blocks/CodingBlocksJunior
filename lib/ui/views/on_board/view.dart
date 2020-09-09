import 'package:coding_blocks_junior/ui/views/on_board/age_group.dart';
import 'package:coding_blocks_junior/ui/views/on_board/interest.dart';
import 'package:coding_blocks_junior/ui/views/on_board/onboard_intro.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:stacked/stacked.dart';
import 'viewmodel.dart';

class OnBoardView extends StatelessWidget {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: getInsetsAll(20),
            child: Column(
              children: [
                Container(
                  margin: getInsetsLTRB(0, 16, 0, 16),
                  child: ScrollingPageIndicator(
                      dotColor: Colors.grey,
                      dotSelectedColor: getColorFromHex('#2167E3'),
                      dotSize:8 * SizeConfig.imageSizeMultiplier,
                      dotSelectedSize: 8 * SizeConfig.imageSizeMultiplier,
                      dotSpacing: 20 * SizeConfig.imageSizeMultiplier,
                      controller: _pageController,
                      itemCount: 3,
                      orientation: Axis.horizontal
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        OnboardIntro(),
                        OnboardAgeGroup(),
                        OnboardInterests()
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => OnBoardViewModel(),
    );
  }
}
