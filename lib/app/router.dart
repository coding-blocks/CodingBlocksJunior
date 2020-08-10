import 'package:auto_route/auto_route_annotations.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/bookmarks/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/home/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/notes/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/profile/view.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/view.dart';
import 'package:coding_blocks_junior/ui/views/on_board/view.dart';
import 'package:coding_blocks_junior/ui/views/course/view.dart';
import 'package:coding_blocks_junior/ui/views/player/view.dart';
import 'package:coding_blocks_junior/ui/views/player/viewmodel.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute (page: OnBoardView, path: '/'),
    AdaptiveRoute (page: CourseView, path: '/courses/:slug'),
    AdaptiveRoute(page: PlayerView, path: '/courses/:courseId/contents/:contentId'),
    AdaptiveRoute (
      page: DashboardView,
      path: '/dashboard',
      initial: true,
      children: <AutoRoute>[
        AdaptiveRoute(page: DashboardHomeView, initial: true),
        AdaptiveRoute(page: DashboardBookmarksView),
        AdaptiveRoute(page: DashboardNotesView),
        AdaptiveRoute(page: DashboardProfileView),
      ]
    ),
  ]
)
class $Router {}