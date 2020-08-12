import 'package:coding_blocks_junior/ui/views/player/player_pages/notes_view/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PlayerNotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 15,
                      color: getColorFromHex('#033194'),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), 
      viewModelBuilder: () => PlayerNotesViewModel()
    );
  }
}
