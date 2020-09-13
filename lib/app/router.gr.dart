// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../models/course.dart';
import '../ui/views/course/view.dart';
import '../ui/views/dashboard/view.dart';
import '../ui/views/on_board/view.dart';
import '../ui/views/player/view.dart';

class Routes {
  static const String onBoardView = '/on-board-view';
  static const String _courseView = '/courses/:slug';
  static String courseView({@required dynamic slug}) => '/courses/$slug';
  static const String dashboardView = '/';
  static const String _playerView = '/courses/:courseId/contents/:contentId';
  static String playerView(
          {@required dynamic courseId, @required dynamic contentId}) =>
      '/courses/$courseId/contents/$contentId';
  static const all = <String>{
    onBoardView,
    _courseView,
    dashboardView,
    _playerView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onBoardView, page: OnBoardView),
    RouteDef(Routes._courseView, page: CourseView),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes._playerView, page: PlayerView),
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
      final args = data.getArgs<CourseViewArguments>(
        orElse: () => CourseViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            CourseView(initialCourseValue: args.initialCourseValue),
        settings: data,
        maintainState: true,
      );
    },
    DashboardView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DashboardView(),
        settings: data,
      );
    },
    PlayerView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PlayerView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CourseView arguments holder class
class CourseViewArguments {
  final Course initialCourseValue;
  CourseViewArguments({this.initialCourseValue});
}
