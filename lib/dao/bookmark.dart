
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookmarkDao {
  @Query('SELECT * FROM Bookmark')
  Future<List<Bookmark>> findAllBookmarks();
}
