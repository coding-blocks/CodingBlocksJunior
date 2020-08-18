import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/ui/widgets/Bookmarks/BookmarkListItem/view.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';

class BookmarkList extends StatelessWidget {
  final List<Bookmark> bookmarks;

  BookmarkList({
    @required this.bookmarks
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookmarks.length,
      itemBuilder: (BuildContext context, int index) => BookmarkListItem(
        bookmark: bookmarks[index],
        color: index.isEven ? getColorFromHex('#FAFCFF') : null
      )
    );
  }
}
