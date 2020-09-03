import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/RaisedGradientButton.dart';
import 'package:coding_blocks_junior/ui/widgets/Notes/AddNote/view.dart';
import 'package:coding_blocks_junior/ui/widgets/Player/notes_view/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PlayerNotesView extends StatelessWidget {
  final Course course;
  final Content content;

  PlayerNotesView({
    @required this.course,
    @required this.content
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: getInsetsLTRB(15, 20, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Notes', style: theme.textTheme.subtitle2,
                  ),
                  RaisedGradientButton(
                    height: 20,
                    width: 20,
                    gradient: LinearGradient(
                      colors: [
                        getColorFromHex('#0575E6'),
                        getColorFromHex('#021B79')
                      ]
                    ),
                    onPressed: () => showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) => AddNote(
                        onSave: (String text) {
                          model
                            .addNote(text)
                            .then(() {
                              Navigator.pop(context);
                            });
                        },
                      )
                    ),
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
      viewModelBuilder: () => PlayerNotesViewModel(course: course, content: content, context: context)
    );
  }
}

class PlayerNotesList extends ViewModelWidget<PlayerNotesViewModel> {
  @override
  Widget build(BuildContext context, PlayerNotesViewModel model) {
    return model.isBusy || model.data == null
      ? Center (
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
    final theme = Theme.of(context);
    return Container(
      padding: getInsetsLTRB(15, 10, 15, 10),
      color: color,
      child: Text(note.text),
    );
  }
}


class PlayerNotesListEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('No notes yet!'),
    );
  }
}



