import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/note.dart';
import 'dao/bookmark.dart';
import 'dao/progress.dart';

import 'models/note.dart';
import 'models/bookmark.dart';
import 'models/progress.dart';

part 'database.g.dart';

@Database(version: 2, entities: [Note, Bookmark, Progress])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;

  BookmarkDao get bookmarkDao;

  ProgressDao get progressDao;
}
