import 'dart:async';
import 'package:coding_blocks_junior/dao/progress.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/note.dart';
import 'dao/bookmark.dart';

import 'models/note.dart';
import 'models/bookmark.dart';

part 'database.g.dart';

@Database(version: 2, entities: [Note, Bookmark])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;
  BookmarkDao get bookmarkDao;
  ProgressDao get progressDao;
}
