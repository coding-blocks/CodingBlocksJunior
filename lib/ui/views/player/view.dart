import 'package:auto_route/auto_route.dart';
import 'package:coding_blocks_junior/ui/views/player/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final params = RouteData.of(context).pathParams;
    String contentId = params['contentId'].value;
    String courseId = params['courseId'].value;

//    print(contentId);

    return ViewModelBuilder<PlayerViewModel>.reactive(
        viewModelBuilder: () => PlayerViewModel(contentId: contentId, courseId: courseId),
        builder: (context, model, child) => Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                model.isBusy || model.ytController == null ? CircularProgressIndicator() :
                YoutubePlayerBuilder(
                  player: YoutubePlayer(controller: model.ytController,),
                  builder: (context, player) => Column(children: <Widget>[player]),
                )
              ],
            ),
          )
      ),
    );
  }
}
