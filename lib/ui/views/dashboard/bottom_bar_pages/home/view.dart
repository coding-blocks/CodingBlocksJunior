import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/course.dart';
import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/home/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/asset_icon.dart';
import 'package:coding_blocks_junior/ui/widgets/Courses/CourseCard/view.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
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
                        padding:
                            getInsetsOnly(bottom: 8.0, left: 28, right: 28),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Hello ',
                                    style: _theme.textTheme.subtitle1,
                                    children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          model.isBusy ? "" : "\n" + model.name,
                                      style: _theme.textTheme.headline4),
                                ])),
                            InkWell(
                              onTap: model.goToNotifications,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: getInsetsAll(8.0),
                                  child: AssetIcon(
                                    asset: 'assets/bell_fill.png',
                                    height: 20 * SizeConfig.imageSizeMultiplier,
                                    width: 20 * SizeConfig.imageSizeMultiplier,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            getInsetsOnly(bottom: 8.0, left: 28, right: 28),
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
        viewModelBuilder: () => locator<DashboardHomeViewModel>());
  }
}

class RecommendedCourseList extends ViewModelWidget<DashboardHomeViewModel> {
  @override
  Widget build(BuildContext context, DashboardHomeViewModel viewModel) {
    if (viewModel.getRecommendedCourses().length > 0)
      return Column(
        children: [
          ...viewModel.getRecommendedCourses().map((course) => CourseCard(
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

class OtherCoursesList extends ViewModelWidget<DashboardHomeViewModel> {
  @override
  Widget build(BuildContext context, DashboardHomeViewModel viewModel) {
    if (viewModel.getOtherCourses().length > 1)
      return Column(
        children: [
          ...viewModel.getOtherCourses().map((course) => CourseCard(
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
