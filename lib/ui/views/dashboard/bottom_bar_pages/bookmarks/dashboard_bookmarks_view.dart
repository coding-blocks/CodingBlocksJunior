import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/bookmarks/dashboard_bookmarks_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardBookmarksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardBookmarksViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('Bookmarks'),
        ),
      ), 
      viewModelBuilder: () => DashboardBookmarksViewModel()
    );
  }
}
