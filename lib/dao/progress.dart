import 'package:coding_blocks_junior/dao/base.dart';
import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/models/progress.dart';
import 'package:floor/floor.dart';

@dao
abstract class ProgressDao extends BaseDao<Progress> {
  @Query('SELECT * FROM Progress')
  Future<List<Progress>> findAllProgress();
}