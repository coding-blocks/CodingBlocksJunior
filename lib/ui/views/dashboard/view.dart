import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/bookmarks/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/home/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/notes/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/profile/view.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/cached.dart';
import 'package:coding_blocks_junior/ui/widgets/BottomBar/dashboard_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.nonReactive(
      builder: (context, model, child) => DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              (DashboardHomeView()),
              (DashboardBookmarksView()),
              (DashboardNotesView()),
              (DashboardProfileView()),
            ],
          ),
          bottomNavigationBar: DashboardNavigationBar()
        )
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
