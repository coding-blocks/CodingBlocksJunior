import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/ui/widgets/Notes/NoteListItem/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:coding_blocks_junior/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:stacked/stacked.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  final Color color;

  NoteListItem({@required this.note, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder<NoteListItemViewModel>.reactive(
        builder: (BuildContext context, NoteListItemViewModel model,
                Widget child) =>
            If(
              !model.isBusy && model.course != null && model.content != null,
              () => Material(
                color: color,
                child: InkWell(
                  onTap: model.goToContent,
                  child: Container(
                    padding: getInsetsAll(30),
                    child: model.isBusy
                        ? Container()
                        : Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      model.course.title +
                                          ' | ' +
                                          model.content.title,
                                      style: theme.textTheme.bodyText1.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: getInsetsLTRB(15, 0, 7, 0),
                                        child: InkWell(
                                          onTap: () => model.onClickEdit(note),
                                          child: Icon(
                                            Icons.edit,
                                            size: 25 *
                                                SizeConfig.imageSizeMultiplier,
                                            color: getColorFromHex('#1D4479'),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap:
                                            model.showDeleteConfirmationDialog,
                                        child: Icon(
                                          Icons.delete,
                                          size: 25 *
                                              SizeConfig.imageSizeMultiplier,
                                          color: getColorFromHex('#1D4479'),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    note.text,
                                    style: theme.textTheme.bodyText2,
                                    textAlign: TextAlign.justify,
                                  ))
                            ],
                          ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () =>
            NoteListItemViewModel(note: note, context: context));
  }
}
