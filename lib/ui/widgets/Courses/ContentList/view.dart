import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/Thumbnail.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/ContentList/viewmodel.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContentListView extends StatelessWidget {
  final Stream<Content> contentStream;
  final Function onTap;

  ContentListView({this.contentStream, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(

        viewModelBuilder: () => ContentListViewModel(contentStream: contentStream),
        builder: (context, model, child) => ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: model.contents.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: ContentListItemView(
                  content: model.contents[index],
                  index: index,
                ),
                onTap: () => onTap(model.contents[index]),
              );
            }));
  }
}

class ContentListItemView extends StatelessWidget {
  final Content content;
  final int index;

  ContentListItemView({@required this.content, this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: getInsetsLTRB(30, index == 0 ? 0 : 15, 30, 15),
      child: IntrinsicHeight(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.expand(
                    width: (SizeConfig.isPortrait ? 150 : 200) *
                        SizeConfig.imageSizeMultiplier),
                child: Container(
                  margin: getInsetsLTRB(0, 0, 15, 0),
                  child: Thumbnail(url: content.url),
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
                        'Lecture ' + (index + 1).toString(),
                        style: theme.textTheme.bodyText2,
                      ),
                      Text(content.title,
                          style: theme.textTheme.subtitle1
                              .copyWith(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Date: 18th Aug, 2020',
                    style: TextStyle(fontSize: 11, color: Colors.black87),
                  ))
            ]),
      ),
    );
  }
}
