import 'package:floor/floor.dart';

@entity
class Note {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String content;
  final String contentId;
  final String courseId;

  Note({
    this.id, 
    this.content, 
    this.contentId,
    this.courseId
  });
}
