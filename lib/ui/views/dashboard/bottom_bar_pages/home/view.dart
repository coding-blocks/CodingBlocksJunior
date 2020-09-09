import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/home/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/view.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return ViewModelBuilder<DashboardHomeViewModel>.nonReactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) => Scaffold(
              body: Padding(
                padding: getInsetsLTRB(0, 56, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: getInsetsOnly(bottom: 8.0, left: 28, right: 28),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(
                                text: 'Hello ',
                                style: _theme.textTheme.subtitle1,
                                children: <TextSpan>[
                              TextSpan(
                                  text: "\n" + model.user.displayName ?? "",
                                  style: _theme.textTheme.headline4),
                            ])),
                      ),
                      Container(
                        padding: getInsetsOnly(bottom: 8.0, left: 28, right: 28),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recommended Course for you!",
                          style: _theme.textTheme.subtitle2,
                        ),
                      ),
                      RecommendedCourseList(),
                      Container(
                        padding: getInsetsLTRB(28, 10, 28, 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Other Courses",
                          style: _theme.textTheme.subtitle2,
                        ),
                      ),
                      OtherCoursesList(),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => DashboardHomeViewModel());
  }
}

class RecommendedCourseList extends ViewModelWidget<DashboardHomeViewModel> {
  @override
  Widget build(BuildContext context, DashboardHomeViewModel viewModel) {
    if (viewModel.courses.length > 0)
      return CourseCard(
        course: viewModel.courses[0],
        onPress: () => viewModel.goToCourse(viewModel.courses[0]),
        isExpanded: viewModel.courses[0].id == viewModel.selectedCourseId,
      );
    else
      return Container();
  }
}

class OtherCoursesList extends ViewModelWidget<DashboardHomeViewModel> {
  @override
  Widget build(BuildContext context, DashboardHomeViewModel viewModel) {
    if (viewModel.courses.length > 1)
      return Column(
        children: [
          ...viewModel.courses.sublist(1).map((course) => CourseCard(
                course: course,
                onPress: () => viewModel.goToCourse(course),
                isExpanded: course.id == viewModel.selectedCourseId,
              ))
        ],
      );
    else
      return Container();
  }
}
