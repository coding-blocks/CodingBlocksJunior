import 'package:auto_route/auto_route.dart';
import 'package:coding_blocks_junior/ui/widgets/BottomBar/dashboard_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        body: ExtendedNavigator(),
        bottomNavigationBar: DashboardNavigationBar()
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
