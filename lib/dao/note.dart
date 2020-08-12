import 'package:coding_blocks_junior/dao/base.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:floor/floor.dart';

@dao
abstract class NoteDao implements BaseDao {
  @Query('SELECT * FROM Note')
  Future<List<Note>> findAllNotes();
}
