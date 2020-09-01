import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/ui/widgets/Notes/NoteListItem/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
    final theme = Theme.of(context);
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, NoteListItemViewModel model, Widget child) => Container(
        padding: EdgeInsets.all(30),
        color: color,
        child: model.isBusy ? Container() : Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  model.course.title + ' | ' + model.content.title,
                  style: theme.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: model.onClickEdit,
                      child: Icon(Icons.edit),
                    ),
                    InkWell(
                      onTap: model.showDeleteConfirmationDialog,
                      child: Icon(Icons.delete),
                    )
                  ],
                )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(note.text, style: theme.textTheme.bodyText2, textAlign: TextAlign.justify,)
            )
          ],
        ),
      ), 
      viewModelBuilder: () => NoteListItemViewModel(note: note, context: context)
    );
  }
}
