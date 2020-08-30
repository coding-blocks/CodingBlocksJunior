import 'package:coding_blocks_junior/ui/views/login/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/RaisedGradientButton.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginView extends StatelessWidget {
  final Function onClose;

  LoginView({
    this.onClose
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () =>
          LoginViewModel(context: context, onClose: onClose),
      builder: (context, model, child) => Container(
        padding: EdgeInsets.all(20 * SizeConfig.imageSizeMultiplier),
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0))),
        height: MediaQuery.of(context).size.height / 2.5 +
            MediaQuery.of(context).viewInsets.bottom,
        child: PageView(
          controller: model.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[MobileInputView(), OtpInputView(), SignupView()],
        ),
      ),
    );
  }
}

class MobileInputView extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        Text(
          "Let's get you onboard",
          style: theme.textTheme.subtitle1),
        Text(
          "Enter your Phone number to get started!",
          style: theme.textTheme.caption,
        ),
        if (SizeConfig.isPortrait) ...[PhoneInputBox(), SendOtpButton()]
        else Row(
          children: [Expanded(child: PhoneInputBox()), SendOtpButton()],
        )
      ],
    );
  }
}

class PhoneInputBox extends  ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Container(
        margin: getInsetsLTRB(0, 50, 0, 0),
        child: InternationalPhoneNumberInput(
          initialValue: PhoneNumber(isoCode: 'IN'),
          textFieldController: model.mobileInputController,
          countries: ['IN'],
        )
    );
  }

}
class SendOtpButton extends  ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Container(
      margin: getInsetsLTRB(10, 50, 0, 0),
      child: RoundedLoadingButton(
        width: 200,
        child: Text(
          'Send Otp',
          style: TextStyle(
              color: Colors.white,
              fontSize: 14 * SizeConfig.textMultiplier,
              fontWeight: FontWeight.bold),
        ),
        onPressed: model.sendOtp,
      ),
    );
  }

}


class OtpInputView extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    final theme = Theme.of(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: getInsetsLTRB(0, 0, 0, 10),
          child: Text(
            "Enter OTP",
            style: theme.textTheme.subtitle1,
          ),
        ),
        Text("Enter the OTP sent to +91-${model.mobile}"),
        // TextField(
        //   controller: model.otpInputController,
        // ),
        PinCodeTextField(
          controller: model.otpInputController,
          onCompleted: model.verifyOtp,
          errorAnimationController: model.otpErrorController,
          enabled: !model.isVerifying,
          length: 6,
          obsecureText: false,
          animationType: AnimationType.fade,
          animationDuration: Duration(milliseconds: 300),
          pinTheme: PinTheme(
            inactiveColor: Colors.blue,
            shape: PinCodeFieldShape.underline,
            fieldHeight: 50,
            fieldWidth: 40,
            // activeFillColor: Colors.white,
          ),
        ),
        Center(
          child: Text(model.errorText, style: TextStyle(color: Colors.red)),
        ),
        if (model.isVerifying) CircularProgressIndicator()
      ],
    );
  }
}

class SignupView extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Container(
      child: FormBuilder(
        key: model.signupFormKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Text('Singup'),
            FormBuilderTextField(
                attribute: "email",
                decoration: InputDecoration(labelText: "Email Address"),
                validators: [
                  FormBuilderValidators.email(),
                  FormBuilderValidators.required(),
                  FormBuilderValidators.max(150),
                ]),
            FormBuilderTextField(
                attribute: "firstname",
                decoration: InputDecoration(labelText: "First Name"),
                validators: [
                  FormBuilderValidators.max(150),
                  FormBuilderValidators.required()
                ]),
            FormBuilderTextField(
                attribute: "lastname",
                decoration: InputDecoration(labelText: "Last Name"),
                validators: [
                  FormBuilderValidators.max(150),
                  FormBuilderValidators.required()
                ]),
            Center(
              child: RaisedButton(
                onPressed: model.signUp,
                child: Text('Sign Up!'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
