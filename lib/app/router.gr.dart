// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../ui/views/course/view.dart';
import '../ui/views/dashboard/bottom_bar_pages/bookmarks/view.dart';
import '../ui/views/dashboard/bottom_bar_pages/home/view.dart';
import '../ui/views/dashboard/bottom_bar_pages/notes/view.dart';
import '../ui/views/dashboard/bottom_bar_pages/profile/view.dart';
import '../ui/views/dashboard/view.dart';
import '../ui/views/on_board/view.dart';
import '../ui/views/player/view.dart';

class Routes {
  static const String onBoardView = '/';
  static const String _courseView = '/courses/:slug';
  static String courseView({@required dynamic slug}) => '/courses/$slug';
  static const String _playerView = '/courses/:courseId/contents/:contentId';
  static String playerView(
          {@required dynamic courseId, @required dynamic contentId}) =>
      '/courses/$courseId/contents/$contentId';
  static const String dashboardView = '/dashboard';
  static const all = <String>{
    onBoardView,
    _courseView,
    _playerView,
    dashboardView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onBoardView, page: OnBoardView),
    RouteDef(Routes._courseView, page: CourseView),
    RouteDef(Routes._playerView, page: PlayerView),
    RouteDef(
      Routes.dashboardView,
      page: DashboardView,
      generator: DashboardViewRouter(),
    ),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    OnBoardView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OnBoardView(),
        settings: data,
      );
    },
    CourseView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CourseView(),
        settings: data,
      );
    },
    PlayerView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PlayerView(),
        settings: data,
      );
    },
    DashboardView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DashboardView(),
        settings: data,
      );
    },
  };
}

class DashboardViewRoutes {
  static const String dashboardHomeView = '/';
  static const String dashboardBookmarksView = '/dashboard-bookmarks-view';
  static const String dashboardNotesView = '/dashboard-notes-view';
  static const String dashboardProfileView = '/dashboard-profile-view';
  static const all = <String>{
    dashboardHomeView,
    dashboardBookmarksView,
    dashboardNotesView,
    dashboardProfileView,
  };
}

class DashboardViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(DashboardViewRoutes.dashboardHomeView, page: DashboardHomeView),
    RouteDef(DashboardViewRoutes.dashboardBookmarksView,
        page: DashboardBookmarksView),
    RouteDef(DashboardViewRoutes.dashboardNotesView, page: DashboardNotesView),
    RouteDef(DashboardViewRoutes.dashboardProfileView,
        page: DashboardProfileView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    DashboardHomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DashboardHomeView(),
        settings: data,
      );
    },
    DashboardBookmarksView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DashboardBookmarksView(),
        settings: data,
      );
    },
    DashboardNotesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DashboardNotesView(),
        settings: data,
      );
    },
    DashboardProfileView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DashboardProfileView(),
        settings: data,
      );
    },
  };
}
