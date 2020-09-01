import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/ui/widgets/Notes/AddNote/view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NoteListItemViewModel extends FutureViewModel<void> {
  final Note note;
  Course course;
  Content content;
  BuildContext context;

  NoteListItemViewModel({
    @required this.note,
    @required this.context
  });

  @override
  Future<void> futureToRun() {
    return loadCourseAndContent();
  }

  Future loadCourseAndContent() async {
    final String courseId = note.courseId;
    final String contentId = note.contentId;

    var courseDoc = await Firestore
      .instance
      .collection('courses')
      .document(courseId)
      .get();

    course = Course.fromSnapshot(courseDoc);

    var contentDoc = await Firestore.instance
        .collection('contents')
        .document(contentId).get();

    content = Content.fromSnapshot(contentDoc);
  }

  onClickEdit() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AddNote(
          noteToEdit: this.note,
          onSave: (String text) async {
            var result = await Firestore
              .instance
              .collection('notes')
              .document(this.note.id)
              .updateData({
                'text': text
              });

            Navigator.pop(context);
            return result;
          }
        ),
      )
    );
  }

  showDeleteConfirmationDialog() {
    Widget cancelButton = FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.pop(this.context);
      },
    );
    Widget deleteButton = FlatButton(
      child: Text('Delete'),
      onPressed: () async {
        var result = await Firestore
          .instance
          .collection('notes')
          .document(this.note.id)
          .delete();
        Navigator.pop(this.context);
        return result;
      },
    );

    showDialog(
      context: this.context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Delete Note"),
        content: Text("Would you like to delete this note?"),
        actions: [
          cancelButton,
          deleteButton
        ],
      )
    );
  }
}
