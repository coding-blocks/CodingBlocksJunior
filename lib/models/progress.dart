import 'package:floor/floor.dart';

@entity
class Progress {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String contentId;
  final String courseId;
  final String timestamp = DateTime.now().millisecondsSinceEpoch as String;

  Progress({
    this.id,
    this.contentId,
    this.courseId,
  });
}
