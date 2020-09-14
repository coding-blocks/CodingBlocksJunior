import 'package:auto_route/auto_route_annotations.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/view.dart';
import 'package:coding_blocks_junior/ui/views/notifications/view.dart';
import 'package:coding_blocks_junior/ui/views/on_board/view.dart';
import 'package:coding_blocks_junior/ui/views/course/view.dart';
import 'package:coding_blocks_junior/ui/views/player/view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute (page: OnBoardView),
    AdaptiveRoute (page: CourseView, path: '/courses/:slug', maintainState: true),
    AdaptiveRoute (page: NotificationView),
    AdaptiveRoute (page: DashboardView, initial: true),
    AdaptiveRoute(page: PlayerView, path: '/courses/:courseId/contents/:contentId'),
  ]
)
class $Router {}