import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/profile/viewmodel.dart';
import 'package:coding_blocks_junior/ui/views/login/view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardProfileViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => DashboardProfileViewModel(),
        builder: (context, model, child) => Scaffold(
            body: Center(
              child: RaisedButton(
                child: Text('Login'),
                onPressed: () => showBottomSheet(elevation: 2,context: context, builder: (context) => LoginView()),
              ),
            ),
          ),
    );
  }
}
