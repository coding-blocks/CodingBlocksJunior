import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/ui/views/courses/courses_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      default:
        return MaterialPageRoute(builder: (context) => CoursesView());
    }
  }
}
