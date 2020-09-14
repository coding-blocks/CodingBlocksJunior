import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/bookmarks/viewmodel.dart';
import 'package:coding_blocks_junior/ui/views/notifications/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/AppBars/dashboard_pages_appbar.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/asset_icon.dart';
import 'package:coding_blocks_junior/ui/widgets/Bookmarks/BookmarkList/view.dart';
import 'package:coding_blocks_junior/ui/widgets/notifications/widget.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return ViewModelBuilder<NotificationViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) => Scaffold(
              appBar: DashboardPagesAppBar(),
              body: Column(
                children: [
                  Container(
                    padding: getInsetsLTRB(30, 10, 30, 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 30 * SizeConfig.imageSizeMultiplier,
                            color: getColorFromHex("#194A88"),
                          ),
                        ),
                        Container(
                          margin: getInsetsLTRB(10, 0, 0, 0),
                          child: Text(
                            'Notifications!',
                            style: _theme.textTheme.headline4,
                          ),
                        )
                      ],
                    ),
                  ),
                  if (!model.isBusy && model.notifications.length == 0)
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/bookmark-blue-5x.png',
                            height: 50 * SizeConfig.imageSizeMultiplier,
                            width: 50 * SizeConfig.imageSizeMultiplier,
                          ),
                          Text('Your Bookmarked videos appears here!',
                              style: _theme.textTheme.subtitle1)
                        ],
                      ),
                    ),
                  if (!model.isBusy && model.notifications.length > 0)
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: model.notifications.length,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                                child: NotificationListItem(
                                    notification: model.notifications[index]),
                                onTap: () => model.notifications[index]),
                      ),
                    ),
                ],
              ),
            ),
        viewModelBuilder: () => NotificationViewModel());
  }
}
