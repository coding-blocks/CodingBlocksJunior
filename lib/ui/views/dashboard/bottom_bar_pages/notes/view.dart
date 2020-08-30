import 'package:coding_blocks_junior/ui/widgets/AppBars/dashboard_pages_appbar.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/asset_icon.dart';
import 'package:coding_blocks_junior/ui/widgets/Notes/NoteList/view.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel.dart';

class DashboardNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder<DashboardNotesViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) => Scaffold(
        appBar: DashboardPagesAppBar(),
        body: Column(
          children: [
            Container(
              padding: getInsetsLTRB(30, 10, 30, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AssetIcon(
                    asset: 'assets/notes-blue.png',
                    height: 26 * SizeConfig.imageSizeMultiplier,
                    width: 26 * SizeConfig.imageSizeMultiplier,
                  ),
                  Container(
                    margin: getInsetsLTRB(10, 0, 0, 0),
                    child: Text('Notes', style: theme.textTheme.headline4),
                  )
                ],
              ),
            ),
            if (!model.isBusy && model.notes.length == 0) Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/notes-blue-5x.png',
                    height: 12 * SizeConfig.imageSizeMultiplier ,
                    width: 12 * SizeConfig.imageSizeMultiplier),
                  Text(
                    'Your Notes appears here!',
                    style: theme.textTheme.subtitle1
                  )
                ],
              ),
            ),
            if (!model.isBusy && model.notes.length > 0) Expanded(
              flex: 1,
              child: NoteList(notes: model.notes),
            ),
          ],
        ),
      ), 
      viewModelBuilder: () => DashboardNotesViewModel()
    );
  }
}
