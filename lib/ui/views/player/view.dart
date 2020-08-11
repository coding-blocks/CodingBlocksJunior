import 'package:auto_route/auto_route.dart';
import 'package:coding_blocks_junior/ui/views/player/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final params = RouteData.of(context).pathParams;
    final arguments = RouteData.of(context).arguments as Map<String, dynamic>;
    String contentId = params['contentId'].value;
    String courseId = params['courseId'].value;

//    print(contentId);

    return ViewModelBuilder<PlayerViewModel>.reactive(
        viewModelBuilder: () =>
            PlayerViewModel(contentId: contentId, courseId: courseId, content: arguments['content']),
        builder: (context, model, child) => Scaffold(
              body: Container(
                child: Column(
                  children: <Widget>[
                    if (model.isBusy || model.ytController == null)
                      Center(child: CircularProgressIndicator())
                    else ...[
                      Hero(
                        tag: model.data.url,
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: model.ytController,
                          ),
                          builder: (context, player) =>
                              Column(children: <Widget>[player]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 30, 20),
                        child: Row(
                          children: <Widget>[
                            Hero(
                              tag: "hero_tag_content_title_$contentId",
                              child: Text(
                                model.data.title,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: getColorFromHex('#1D4479')),
                              ),
                            ),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.share),
                                SizedBox(width: 20,),
                                Icon(Icons.bookmark)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ));
  }
}
