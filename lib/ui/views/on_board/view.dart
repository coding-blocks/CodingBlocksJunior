import 'package:coding_blocks_junior/ui/views/on_board/age_group.dart';
import 'package:coding_blocks_junior/ui/views/on_board/interest.dart';
import 'package:coding_blocks_junior/ui/views/on_board/onboard_intro.dart';
import 'package:flutter/material.dart';
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
