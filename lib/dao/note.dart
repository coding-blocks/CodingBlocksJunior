import 'package:coding_blocks_junior/dao/base.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:floor/floor.dart';

@dao
abstract class NoteDao extends BaseDao<Note> {
  @Query('SELECT * FROM Note')
  Future<List<Note>> findAllNotes();

  @Query('SELECT * FROM Note WHERE courseId=:courseId AND contentId=:contentId')
  Future<List<Note>> findNotesByCourseAndContent(String courseId, String contentId);
}
