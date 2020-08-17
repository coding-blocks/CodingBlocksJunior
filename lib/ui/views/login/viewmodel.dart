import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/services/amoeba_api.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  AmoebaApiService amoebaApiService = locator<AmoebaApiService>();
  SessionService sessionService = locator<SessionService>();

  final mobileInputController = new TextEditingController();
  final otpInputController = new TextEditingController();
  String mobile;
  String errorText = '';
  final pageController = new PageController(initialPage: 0);

  BuildContext context;
  var onClose;

  LoginViewModel({this.context, this.onClose});

  Future sendOtp() async {
    mobile = mobileInputController.value.text;
    try {
      await amoebaApiService.dio.post('/otp', data: {'phone': "+91-$mobile"});
      nextPage();
    } catch (e) {
      print(e);
      this.errorText = "Can't send OTP to that number";
      notifyListeners();
    }
  }

  Future verifyOtp() async {
    final otp = otpInputController.value.text;
    errorText = '';
    notifyListeners();

    final user = sessionService.user;
    try {
      final response = await amoebaApiService.dio.post('/otp/verify', data: {
        "phone": "+91-$mobile",
        "otp": otp.toString(),
        "client": "junior_app",
        if (user.isAnonymous) "uid": user.uid
      });
      await sessionService.login(response.data);
      this.onClose(); // notify parent of close; to update ui with populated user
      Navigator.pop(context); // close the bottom sheet modal
    } on DioError catch (e) {
      if (e.response.data['error'] == 'invalid_grant') {
        this.errorText = 'Invalid Otp';
        notifyListeners();
      }
    }
  }

  void nextPage() => pageController.nextPage(
      duration: Duration(milliseconds: 500), curve: Curves.ease);
}
