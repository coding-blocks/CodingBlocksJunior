import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:coding_blocks_junior/models/classpill.dart';
import 'package:coding_blocks_junior/models/radio.dart';
import 'package:coding_blocks_junior/services/local_storage_service.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();

  final _title = 'On-Boarding';

  String get title => _title;

  List<RadioModel> sampleData = [
    RadioModel(false, "Foundation", [
      ClassPillModel(text: "1", color: getColorFromHex("#F5C792")),
      ClassPillModel(text: "2", color: getColorFromHex("#85CEF2")),
      ClassPillModel(text: "3", color: getColorFromHex("#E99C9F")),
      ClassPillModel(text: "4", color: getColorFromHex("#F5C792"))
    ]),
    RadioModel(false, "Junior", [
      ClassPillModel(text: "5", color: getColorFromHex("#85CEF2")),
      ClassPillModel(text: "6", color: getColorFromHex("#E99C9F")),
      ClassPillModel(text: "7", color: getColorFromHex("#F5C792")),
      ClassPillModel(text: "8", color: getColorFromHex("#85CEF2")),
    ]),
    RadioModel(false, "Middle", [
      ClassPillModel(text: "9", color: getColorFromHex("#E99C9F")),
      ClassPillModel(text: "10", color: getColorFromHex("#F5C792")),
    ]),
    RadioModel(false, "Senior", [
      ClassPillModel(text: "11", color: getColorFromHex("#85CEF2")),
      ClassPillModel(text: "12", color: getColorFromHex("#E99C9F"))
    ]),
  ];

  List<String> classGroupArray = [
    "1st - 4th",
    "5th - 8th",
    "9th - 10th",
    "11th - 12th"
  ];

  Future saveClass(int classGroup) async {
    sampleData.forEach((element) => element.isSelected = false);
    sampleData[classGroup].isSelected = true;
    notifyListeners();
    _localStorageService.preferences.setString('classGroup', classGroupArray[classGroup]);
  }

  Future goToHome(List<String> selectedReportList) async {
    _localStorageService.preferences.setBool('firstRun', false);
    await _navigationService.clearStackAndShow(Routes.dashboardView);
  }
}
