import 'package:coding_blocks_junior/ui/widgets/AppBars/dashboard_pages_appbar.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/asset_icon.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel.dart';

class DashboardNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardNotesViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: DashboardPagesAppBar(),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 12, 30, 0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AssetIcon(
                    asset: 'assets/notes-blue.png',
                    height: 26,
                    width: 26,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'Notes',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: getColorFromHex('#1D4479')
                      ),
                    ),
                  )
                ],
              ),
              if (!model.isBusy && model.data.length == 0) Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/notes-blue.png', height: 82, width: 82,),
                    Text(
                      'Your Notes appears here!',
                      style: TextStyle(
                        fontSize: 14,
                        color: getColorFromHex('#1D4479')
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ), 
      viewModelBuilder: () => DashboardNotesViewModel()
    );
  }
}
