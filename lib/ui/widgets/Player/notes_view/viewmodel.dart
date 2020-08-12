import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/services/store.dart';
import 'package:coding_blocks_junior/viewmodels/reloadable_future_viewmodel.dart';
import 'package:flutter/material.dart';

class PlayerNotesViewModel extends ReloadableFutureViewModel<List<Note>> {
  StoreService _storeService = locator<StoreService>();
  final Course course;
  final Content content;

  PlayerNotesViewModel({
    @required this.course, 
    @required this.content
  });

  Future<List<Note>> futureToRun() {
    return _storeService.database.noteDao.findNotesByCourseAndContent(course.id, content.id);
  }

  Future addSampleNote() async {
    _storeService.database.noteDao.insert(Note(
      content: 'Something note',
      courseId: course.id,
      contentId: content.id
    ));
    await loadData();
    notifyListeners();
  }
}
