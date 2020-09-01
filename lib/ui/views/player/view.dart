import 'package:auto_route/auto_route.dart';
import 'package:coding_blocks_junior/ui/views/player/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Player/notes_view/view.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final params = RouteData.of(context).pathParams;
    final arguments = RouteData.of(context).arguments as Map<String, dynamic>;
    String contentId = params['contentId'].value;
    String courseId = params['courseId'].value;
    final theme = Theme.of(context);

    return ViewModelBuilder<PlayerViewModel>.reactive(
      viewModelBuilder: () => PlayerViewModel(
        contentId: contentId, 
        courseId: courseId, 
        content: arguments == null ? null : arguments['content']
      ),
      builder: (context, model, child) => YoutubePlayerBuilder(
        player: YoutubePlayer(controller: model.ytController,),
        builder: (context, player) => Scaffold(
          body: Column(
            children: <Widget>[
              if (model.isBusy || model.ytController == null)
                Center(child: CircularProgressIndicator())
              else ...[
                // Hero(
                //   tag: model.data.url,
                //   // child: YoutubePlayerBuilder(
                //   //   player: YoutubePlayer(
                //   //     controller: model.ytController,
                //   //     // bottomActions: [
                //   //     //   FullScreenButton()
                //   //     // ],
                //   //   ),
                //   //   builder: (context, player) {
                //   //     // SystemChrome.setEnabledSystemUIOverlays([]);
                //   //     return
                //   //   },
                //   // ),
                //   child: Column(children: <Widget>[player]),
                // ),
                Expanded(child: player),
                Padding(
                  padding: getInsetsLTRB(15, 20, 15, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: "hero_tag_content_title_$contentId",
                        child: Text(
                            model.data.title,
                            style: theme.textTheme.subtitle2),
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: getInsetsLTRB(0, 0, 15, 0),
                            child: Icon(
                              Icons.share,
                              size: 15.0 * SizeConfig.imageSizeMultiplier,
                              color: getColorFromHex('#033194'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              model.toggleBookmark();
                            },
                            child: Icon(
                              model.bookmark != null ? Icons.bookmark : Icons.bookmark_border,
                              size: 15.0 * SizeConfig.imageSizeMultiplier,
                              color: getColorFromHex('#033194'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: PlayerNotesView(
                      course: model.course,
                      content: model.content,
                    )
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
