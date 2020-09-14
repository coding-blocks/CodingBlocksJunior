import 'package:coding_blocks_junior/models/notification.dart' as Notifications;
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationListItem extends StatelessWidget {
  final Notifications.Notification notification;

  NotificationListItem({@required this.notification});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: getInsetsLTRB(30, 15, 30, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            notification.title,
            style: _theme.textTheme.bodyText2,
          ),
          Text(notification.subtitle,
              style: _theme.textTheme.subtitle1
                  .copyWith(fontWeight: FontWeight.bold)),
          Align(
              alignment: Alignment.bottomRight,
              child: Text(
                timeago.format(notification.date.toDate()),
                style: TextStyle(fontSize: 11, color: Colors.black87),
              ))
        ],
      ),
    );
  }
}
