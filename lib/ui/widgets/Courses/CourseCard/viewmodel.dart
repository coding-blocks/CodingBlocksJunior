import 'package:coding_blocks_junior/models/course.dart';
import 'package:stacked/stacked.dart';

class CourseCardViewModel extends BaseViewModel {
  final Course course;
  final Function onPress;

  CourseCardViewModel({this.course, this.onPress});
}