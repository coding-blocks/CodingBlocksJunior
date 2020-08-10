import 'package:floor/floor.dart';

@entity
class Note {
  @primaryKey
  final int id;
  final String content;
  final String videoId;

  Note({
    this.id, 
    this.content, 
    this.videoId
  });
}
