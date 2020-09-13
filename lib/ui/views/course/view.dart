import 'package:auto_route/auto_route.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/ui/widgets/AppBars/course_page_appbar.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:coding_blocks_junior/ui/views/course/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/ContentList/view.dart';

class CourseView extends StatelessWidget {
  Course initialCourseValue;

  CourseView({this.initialCourseValue});

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);
    String slug = routeData == null ? null : routeData.pathParams['slug'].value;
    // String slug;

    return ViewModelBuilder<CourseViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: CoursePageHeader(model.data,
                  maxExtent: 170,
                  minExtent: 100
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  // Container(
                  //   height: 500,
                  //   child: Center(child: Text("Latest")),
                  //   color: Colors.black26
                  // ),
                  ContentListView(
                      contentStream: model.data.contentStream,
                      onTap: model.goToContent
                  )
                ]),
              )
            ],
          )
      ),
      viewModelBuilder: () => CourseViewModel(slug: slug, initialCourseValue: initialCourseValue)
    );
  }
}
