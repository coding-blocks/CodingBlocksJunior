// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/courses/courses_view.dart';
import '../ui/views/on_board/on_board_view.dart';

class Routes {
  static const String onBoardView = '/';
  static const String coursesView = '/courses-view';
  static const all = <String>{
    onBoardView,
    coursesView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onBoardView, page: OnBoardView),
    RouteDef(Routes.coursesView, page: CoursesView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    OnBoardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnBoardView(),
        settings: data,
      );
    },
    CoursesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CoursesView(),
        settings: data,
      );
    },
  };
}
