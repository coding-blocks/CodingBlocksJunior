import 'package:coding_blocks_junior/ui/views/on_board/age_group.dart';
import 'package:coding_blocks_junior/ui/views/on_board/interest.dart';
import 'package:coding_blocks_junior/ui/views/on_board/onboard_intro.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel.dart';

class OnBoardView extends StatelessWidget {
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(
      initialPage: 0,
    );
    return ViewModelBuilder<OnBoardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            OnboardIntro(),
            OnboardAgeGroup(),
            OnboardInterests()
          ],
        ),
      ),
      viewModelBuilder: () => OnBoardViewModel(),
    );
  }
}
