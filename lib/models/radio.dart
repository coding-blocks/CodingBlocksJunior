import 'classpill.dart';

class RadioModel {
  bool isSelected;
  final String text;
  final List<ClassPillModel> classes;

  RadioModel(this.isSelected, this.text, this.classes);
}
