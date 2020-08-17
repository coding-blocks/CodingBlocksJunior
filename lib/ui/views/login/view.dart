import 'package:coding_blocks_junior/ui/views/login/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  var onClose;

  LoginView({this.onClose});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () =>
          LoginViewModel(context: context, onClose: onClose),
      builder: (context, model, child) => Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(width: 1.0)),
        height: MediaQuery.of(context).size.height / 3,
        child: PageView(
          controller: model.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[MobileInputView(), OtpInputView()],
        ),
      ),
    );
  }
}

class MobileInputView extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Column(
      children: <Widget>[
        Text("Let's get you onboard"),
        TextField(
          controller: model.mobileInputController,
        ),
        RaisedButton(
          child: Text('Send Otp'),
          onPressed: model.sendOtp,
        )
      ],
    );
  }
}

class OtpInputView extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Column(
      children: <Widget>[
        Text("Enter the OTP sent to +91-${model.mobile}"),
        TextField(
          controller: model.otpInputController,
        ),
        RaisedButton(
          child: Text('Verify Otp'),
          onPressed: model.verifyOtp,
        ),
        Center(
          child: Text(model.errorText, style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
