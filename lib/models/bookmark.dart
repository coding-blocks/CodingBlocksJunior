import 'package:floor/floor.dart';

@entity
class Bookmark {
  @primaryKey
  final int id;
  final String contentId;
  final String courseId;

  Bookmark({
    this.id, 
    this.contentId,
    this.courseId
  });
}
