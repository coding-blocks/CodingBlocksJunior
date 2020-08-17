import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/viewmodels/reloadable_future_viewmodel.dart';
import 'package:flutter/material.dart';

class PlayerNotesViewModel extends ReloadableFutureViewModel<List<Note>> {
  final Course course;
  final Content content;

  PlayerNotesViewModel({
    @required this.course, 
    @required this.content
  });

  Future<List<Note>> futureToRun() async {
    return [];
  }

  Future addSampleNote() async {
    // TODO
  }
}
