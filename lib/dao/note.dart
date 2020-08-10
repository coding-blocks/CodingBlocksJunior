import 'package:coding_blocks_junior/models/note.dart';
import 'package:floor/floor.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM Note')
  Future<List<Note>> findAllNotes();

  @insert
  Future<void> insertNote(Note note);
}
