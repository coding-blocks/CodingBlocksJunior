import 'package:coding_blocks_junior/models/bookmark.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/Thumbnail.dart';
import 'package:coding_blocks_junior/ui/widgets/Bookmarks/BookmarkListItem/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:coding_blocks_junior/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BookmarkListItem extends StatelessWidget {
  final Bookmark bookmark;
  final Color color;

  BookmarkListItem({@required this.bookmark, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ViewModelBuilder<BookmarkListItemViewModel>.reactive(
        builder: (BuildContext context, BookmarkListItemViewModel model,
                Widget child) =>
            If(
              !model.isBusy,
              () => InkWell(
                onTap: model.goToContent,
                child: Container(
                    color: color,
                    padding: getInsetsLTRB(30, 15, 30, 15),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints.expand(width: (SizeConfig.isPortrait ? 150 : 200) * SizeConfig.imageSizeMultiplier),
                            child: Container(
                              margin: getInsetsLTRB(0, 0, 15, 0),
                              child: Thumbnail(url: model.content.url),
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
                                    style: theme.textTheme.bodyText2,
                                  ),
                                  Text(model.content.title,
                                      style: theme.textTheme.subtitle1.copyWith(
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset('assets/bookmark-blue.png',
                                height: 30 * SizeConfig.imageSizeMultiplier , width: 30 * SizeConfig.imageSizeMultiplier),
                          )
                        ],
                      ),
                    )),
              ),
            ),
        viewModelBuilder: () => BookmarkListItemViewModel(bookmark: bookmark));
  }
}
