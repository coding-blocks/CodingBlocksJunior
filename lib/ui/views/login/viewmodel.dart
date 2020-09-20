import 'dart:async';
import 'dart:convert';

import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/services/amoeba_api.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  AmoebaApiService amoebaApiService = locator<AmoebaApiService>();
  SessionService sessionService = locator<SessionService>();

  final StreamController<ErrorAnimationType> otpErrorController =
      StreamController<ErrorAnimationType>();
  final mobileInputController = new TextEditingController();
  final otpInputController = new TextEditingController();
  String mobile;
  String otpClaimId;
  String errorText = '';
  bool isVerifying = false;
  bool isEnabled = false;
  final pageController = new PageController(initialPage: 0);
  final signupFormKey = GlobalKey<FormBuilderState>();

  get user => sessionService.user;

  BuildContext context;
  var onClose;

  LoginViewModel({this.context, this.onClose});

  Future _findUserByMobile(String mobile) async {
    try {
      final response = await amoebaApiService.dio
          .post('/users/find', data: {"verifiedmobile": "+91-$mobile"});

      return response?.data[0];
    } catch (error) {
      if (error is DioError && error.response.statusCode == 404) {
        return null;
      } else {
        rethrow;
      }
    }
  }

  Future sendOtp() async {
    mobile = mobileInputController.value.text
        .replaceAll(' ', ''); // effectively trim string
    try {
      final response = await amoebaApiService.dio
          .post('/jwt/otp/v2', data: {'mobile': "$mobile", 'dialCode': '91'});
      otpClaimId = response.data['id'];
      nextPage();
    } catch (e) {
      print(e);
      this.errorText = "Can't send OTP to that number";
      notifyListeners();
    }
  }

  void enableOtpButton(PhoneNumber number) {
    if (number.parseNumber().length == 10)
      isEnabled = true;
    else
      isEnabled = false;
    notifyListeners();
  }

  Future verifyOtp(String otp) async {
    // reset state
    this.errorText = '';
    this.isVerifying = true;
    notifyListeners();

    try {
      await amoebaApiService.dio
          .post('/jwt/otp/v2/$otpClaimId/verify', data: {'otp': otp});

      // check if we can login or not
      final apiUser = await this._findUserByMobile(
          mobile); // check if this mobile number is registered.
      final canLogin = apiUser != null;

      if (!canLogin) {
        // signup flow, get user details
        return pageController.jumpToPage(2); // jump to singup screen
      } else {
        final response = await amoebaApiService.dio
            .post('/junior/otp/$otpClaimId/login', data: {
          "client": "junior_app",
          if (user.isAnonymous) "uid": user.uid
        });
        await sessionService.login(response.data);

        this.close();
      }
    } on DioError catch (e) {
      otpErrorController.add(ErrorAnimationType.shake);
      this.errorText = 'Wrong OTP';
      this.isVerifying = false;
      notifyListeners();
    }
  }

  Future signUp() async {
    final state = signupFormKey.currentState;
    if (state.saveAndValidate()) {
      try {
        final response = await amoebaApiService.dio.post(
            '/junior/users', data: {
          'username': 'junior' + mobile,
          'mobile': "+91-$mobile",
          'firstname': state.value['firstname'].trim(),
          'lastname': state.value['lastname'].trim(),
          'email': state.value['email'].trim(),
          'password': generateRandomString(16),
          'claimId': otpClaimId,
          'client': 'junior_app',
          if (user.isAnonymous) "uid": user.uid
        });
        await sessionService.login(response.data);
        this.close();
      } on DioError catch (e) {
        if (e.response != null) {
          final data = e.response.data['message'];
          if (data.indexOf("EMAIL_ALREADY_EXISTS") != -1) {
            this.errorText = 'Email Already Exists';
          } else {
            this.errorText = "Cannot create user.";
          }
        }
        notifyListeners();
      }

    }
    else {
      throw Error();
    }
  }

  void nextPage() => pageController.nextPage(
      duration: Duration(milliseconds: 500), curve: Curves.ease);

  void close() {
    this.onClose(); // notify parent of close; to update ui with populated user
    Navigator.pop(context);
  }
}
