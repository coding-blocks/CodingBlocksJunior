import 'package:coding_blocks_junior/models/course.dart';
import 'package:stacked/stacked.dart';

class CourseCardViewModel extends BaseViewModel {
  final Course course;
  final bool isExpanded;
  final Function onPress;

  CourseCardViewModel({this.course, this.isExpanded = false, this.onPress});
}