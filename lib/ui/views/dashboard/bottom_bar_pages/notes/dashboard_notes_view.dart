import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_notes_viewmodel.dart';

class DashboardNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardNotesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('Notes'),
        ),
      ), 
      viewModelBuilder: () => DashboardNotesViewModel()
    );
  }
}
