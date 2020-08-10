import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:coding_blocks_junior/ui/views/course/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Course/ContentList/view.dart';

class CourseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String slug = RouteData
        .of(context)
        .pathParams['slug']
        .value;

    return ViewModelBuilder<CourseViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          body: Container(
            padding: EdgeInsets.all(30),
              child: model.isBusy ? CircularProgressIndicator() :
              ContentListView(contentStream: model.data.contentStream, onTap: model.goToContent,)
          )    
    ),
        viewModelBuilder: () => CourseViewModel(slug)
    );
  }
}