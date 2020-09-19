import 'package:coding_blocks_junior/ui/views/on_board/age_group.dart';
import 'package:coding_blocks_junior/ui/views/on_board/interest.dart';
import 'package:coding_blocks_junior/ui/views/on_board/onboard_intro.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/RaisedGradientButton.dart';
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
    final theme = Theme.of(context);
    return ViewModelBuilder<OnBoardViewModel>.reactive(
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/onboard_background.webp"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                      child: PageView(
                    controller: _pageController,
                    children: [
                      OnboardIntro(),
                      OnboardAgeGroup(),
                      OnboardInterests()
                    ],
                  )),
                  Container(
                    margin: getInsetsLTRB(0, 16, 0, 36),
                    child: ScrollingPageIndicator(
                        dotColor: getColorFromHex("#4DFFFFFF"),
                        dotSelectedColor: Colors.white,
                        dotSize: 8 * SizeConfig.imageSizeMultiplier,
                        dotSelectedSize: 8 * SizeConfig.imageSizeMultiplier,
                        dotSpacing: 20 * SizeConfig.imageSizeMultiplier,
                        controller: _pageController,
                        itemCount: 3,
                        orientation: Axis.horizontal),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12.0),
                          topRight: const Radius.circular(12.0),
                        )),
                    child: Padding(
                      padding: getInsetsAll(40),
                      child: Column(
                        children: [
                          Text('Let’s get you onboard  🙌',
                              style: theme.textTheme.bodyText1),
                          Padding(
                            padding: getInsetsOnly(top: 16),
                            child: RaisedGradientButton(
                              cornerRadius: 5,
                              height: 50 * SizeConfig.heightMultiplier,
                              child: Text('Continue with phone number',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                              onPressed: model.login,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => OnBoardViewModel(context: context),
    );
  }
}
