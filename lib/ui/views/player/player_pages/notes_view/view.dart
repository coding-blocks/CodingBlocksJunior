import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/ui/views/player/player_pages/notes_view/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/gradient_button.dart';
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
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 15,
                      color: getColorFromHex('#033194'),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GradientButton(
                    height: 20,
                    width: 20,
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        getColorFromHex('#0575E6'),
                        getColorFromHex('#021B79')
                      ]
                    ),
                    onPressed: model.addSampleNote,
                    child: Text(
                      '+', 
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: PlayerNotesList(),
            )
          ],
        ),
      ), 
      viewModelBuilder: () => PlayerNotesViewModel()
    );
  }
}

class PlayerNotesList extends ViewModelWidget<PlayerNotesViewModel> {
  @override
  Widget build(BuildContext context, PlayerNotesViewModel model) {
    return model.isBusy 
      ?  Container(
        child: CircularProgressIndicator(),
      )
      : ListView.builder(
        itemCount: model.data.length,
        itemBuilder: (BuildContext context, int index) => PlayerNotesListItem(
          note: model.data[index],
          color: index.isEven ? getColorFromHex('#FAFCFF') : Colors.white
        )
      );
  }
}

class PlayerNotesListItem extends StatelessWidget {
  final Color color;
  final Note note;

  PlayerNotesListItem({
    this.color,
    @required this.note
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      color: color,
      child: Text(note.content),
    );
  }
}
