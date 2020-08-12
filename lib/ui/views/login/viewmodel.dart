import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/services/amoeba_api.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  AmoebaApiService amoebaApiService = locator<AmoebaApiService>();
  final mobileInputController = new TextEditingController();
  final otpInputController = new TextEditingController();
  String mobile;

  final pageController = new PageController(initialPage: 0);

  Future sendOtp() async {
    mobile = mobileInputController.value.text;
    try {
//      await amoebaApiService.dio.post('/jwt/otp', data: {
//        'phone': "+91-$mobile"
//      });

      await Future.delayed(Duration(seconds: 2));
      nextPage();
    } catch (e) {
      print(e);
    }
  }

  Future verifyOtp() async {
    final otp = otpInputController.value.text;
    final response = await amoebaApiService.dio.post('/jwt/otp/verify', data: {
      "phone": "+91-$mobile",
      "otp": otp.toString(),
      "client": "android"
    });

    nextPage();
    print(response.data);
  }

  void nextPage () => pageController.nextPage(
      duration: Duration(milliseconds: 500), curve: Curves.ease);
}
