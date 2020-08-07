import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/profile/dashboard_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('Profile'),
        ),
      ), 
      viewModelBuilder: () => DashboardProfileViewModel()
    );
  }
}