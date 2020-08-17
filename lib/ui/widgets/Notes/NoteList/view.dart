import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/ui/widgets/Notes/NoteListItem/view.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;

  const NoteList({
    @required this.notes
  });
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) => NoteListItem(
        note: notes[index],
        color: index.isEven ? getColorFromHex('#FAFCFF') : null
      )
    );
  }
}
