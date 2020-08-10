import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel.dart';

class DashboardNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardNotesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy ? CircularProgressIndicator() : Column(
          children: [
            FlatButton(
              onPressed: model.addNote,
              child: Text('Add Note'),
            ),
            ...model.data.map((note) => Text(note.content)).toList()
          ],
        ),
      ), 
      viewModelBuilder: () => DashboardNotesViewModel()
    );
  }
}
