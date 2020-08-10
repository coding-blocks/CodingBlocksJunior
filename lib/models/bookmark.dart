import 'package:floor/floor.dart';

@entity
class Bookmark {
  @primaryKey
  final int id;
  final String videoId;

  Bookmark({
    this.id, 
    this.videoId
  });
}
