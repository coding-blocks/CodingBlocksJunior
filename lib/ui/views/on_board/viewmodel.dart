import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:coding_blocks_junior/models/classpill.dart';
import 'package:coding_blocks_junior/models/radio.dart';
import 'package:coding_blocks_junior/services/local_storage_service.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:coding_blocks_junior/ui/views/login/view.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  SessionService sessionService = locator<SessionService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  BuildContext context;

  final _title = 'On-Boarding';

  String get title => _title;

  OnBoardViewModel({this.context});

  FirebaseUser get user => sessionService.user;
  get name => user.isAnonymous ? 'Anonymous' : user.displayName;
  get photo => user.isAnonymous ? 'http://minio-i.codingblocks.com/img/default-anon.jpg' : (user.photoUrl ?? 'http://minio-i.codingblocks.com/img/default-anon.jpg');
  get fbKey => _fbKey;

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

  List<List<String>> classGroupArray = [
    ["1", "4"],
    ["5", "8"],
    ["9", "10"],
    ["11", "12"]
  ];

  Future saveClass(int classGroup) async {
    sampleData.forEach((element) => element.isSelected = false);
    sampleData[classGroup].isSelected = true;
    notifyListeners();
    _localStorageService.preferences
        .setStringList('classGroup', classGroupArray[classGroup]);
  }

  Future goToHome(List<String> selectedReportList) async {
    _localStorageService.preferences.setBool('firstRun', false);
    await _navigationService.clearStackAndShow(Routes.dashboardView);
  }

  void login() async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: LoginView(onClose: () async {
                await this.futureToRun();
                notifyListeners();
              }),
            ));
  }

  @override
  Future futureToRun() async {
    if (user.isAnonymous) return null;
    _localStorageService.preferences.setBool('firstRun', false);
    await _navigationService.clearStackAndShow(Routes.dashboardView);
  }
}
