import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/Thumbnail.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/asset_icon.dart';
import 'package:coding_blocks_junior/ui/widgets/Bookmarks/BookmarkListItem/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BookmarkListItem extends StatelessWidget {
  final Bookmark bookmark;
  final Color color;

  BookmarkListItem({@required this.bookmark, this.color});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return ViewModelBuilder<BookmarkListItemViewModel>.reactive(
        builder: (BuildContext context, BookmarkListItemViewModel model,
                Widget child) =>
            If(
              !model.isBusy,
              () => InkWell(
                onTap: model.goToContent,
                child: Container(
                    padding: EdgeInsets.all(30),
                    color: color,
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: SizedBox(
                              child: Thumbnail(url: model.content.url),
                              width: 100 * SizeConfig.widthMultiplier,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    model.course.title,
                                    style: TextStyle(
                                        color: getColorFromHex('#194A88'),
                                        fontSize:
                                        8 * SizeConfig.textMultiplier),
                                  ),
                                  Text(
                                    model.content.title,
                                    style: TextStyle(
                                        color: getColorFromHex('#194A88'),
                                        fontSize:
                                            12 * SizeConfig.textMultiplier,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: AssetIcon(
                                asset: 'assets/bookmark-blue.png',
                                height: 16,
                                width: 16,
                              ))
                        ],
                      ),
                    )),
              ),
            ),
        viewModelBuilder: () => BookmarkListItemViewModel(bookmark: bookmark));
  }
}
