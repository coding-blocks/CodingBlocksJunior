import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/ui/widgets/Notes/AddNote/view.dart';
import 'package:coding_blocks_junior/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NoteListItemViewModel extends FutureViewModel<void> {
  NavigationService _navigationService = locator<NavigationService>();

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

  onClickEdit(Note targetNote) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AddNote(
          noteToEdit: targetNote,
          onSave: (String text) async {
            var result = await Firestore
              .instance
              .collection('notes')
              .document(targetNote.id)
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
    final theme = Theme.of(context);

    cancel () => Navigator.pop(this.context);

    confirmDelete () {
      Navigator.pop(this.context);
      return Firestore
          .instance
          .collection('notes')
          .document(this.note.id)
          .delete();
    };

    showDialog(
      context: this.context,
      child: confirmDialog(
        heading: Text("Delete Note", style: theme.textTheme.headline6,),
        description: Text("Would you like to delete this note?"),
        confirmButtonText: Text('Delete', style: theme.textTheme.bodyText2),
        confirmAction: confirmDelete,
        cancelButtonText: Text('Cancel', style: theme.textTheme.bodyText2),
        cancelAction: cancel
      )
    );
  }

  void goToContent () {
    _navigationService.navigateTo(Routes.playerView(
        courseId: note.courseId,
        contentId: note.contentId
    ));
  }
}
