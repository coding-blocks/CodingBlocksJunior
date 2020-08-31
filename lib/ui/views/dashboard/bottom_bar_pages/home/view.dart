import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/home/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return ViewModelBuilder<DashboardHomeViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 56, 28, 56),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: 'Hello ',
                              style: _theme.textTheme.subtitle1,
                              children: <TextSpan>[
                            TextSpan(
                                text: '\nPulkit',
                                style: _theme.textTheme.headline4),
                          ])),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Recommended Course for you!",
                        style: _theme.textTheme.subtitle2,
                      ),
                    ),
                    if (model.courses.length > 0)
                      CourseCard(
                        course: model.courses[0],
                        isExpanded: true,
                      ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Other Courses",
                        style: _theme.textTheme.subtitle2,
                      ),
                    ),
                    ...(model.courses.sublist(1).map((course) => CourseCard(
                          course: course,
                          onPress: () => model.goToCourse(course),
                        )))
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => DashboardHomeViewModel());
  }
}
