// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../ui/views/course/view.dart';
import '../ui/views/dashboard/view.dart';
import '../ui/views/on_board/view.dart';

class Routes {
  static const String onBoardView = '/on-board-view';
  static const String dashboardView = '/';
  static const String _courseView = '/courses/:slug';
  static String courseView({@required dynamic slug}) => '/courses/$slug';
  static const all = <String>{
    onBoardView,
    dashboardView,
    _courseView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onBoardView, page: OnBoardView),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes._courseView, page: CourseView),
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
    DashboardView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DashboardView(),
        settings: data,
      );
    },
    CourseView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CourseView(),
        settings: data,
      );
    },
  };
}
