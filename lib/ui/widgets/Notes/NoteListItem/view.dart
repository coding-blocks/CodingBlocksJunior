import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/ui/widgets/Notes/NoteListItem/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  final Color color;

  NoteListItem({
    @required this.note,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, NoteListItemViewModel model, Widget child) => Container(
        padding: EdgeInsets.all(30),
        color: color,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  model.course.title + ' | ' + model.content.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: getColorFromHex('#1D4479')
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.edit),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(note.content)
            )
          ],
        ),
      ), 
      viewModelBuilder: () => NoteListItemViewModel(note: note)
    );
  }
}
