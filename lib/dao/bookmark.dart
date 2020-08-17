
import 'package:coding_blocks_junior/dao/base.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookmarkDao extends BaseDao<Bookmark> {
  @Query('SELECT * FROM Bookmark')
  Future<List<Bookmark>> findAllBookmarks();
}
