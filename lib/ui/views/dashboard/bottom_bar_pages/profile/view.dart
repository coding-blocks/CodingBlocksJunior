import 'package:coding_blocks_junior/ui/views/dashboard/bottom_bar_pages/profile/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/AppBars/dashboard_pages_appbar.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/asset_icon.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

class DashboardProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return ViewModelBuilder<DashboardProfileViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => DashboardProfileViewModel(context: context),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: DashboardPagesAppBar(),
        body: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: Row(
              children: <Widget>[
                AssetIcon(
                  asset: 'assets/notes-blue.png',
                  height: 26,
                  width: 26,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Profile',
                    style: _theme.textTheme.headline4)
              ],
            ),
          ),
          SizedBox(height: 30),
          CircleAvatar(
            radius: 55,
            backgroundImage: new NetworkImage(model.photo),
          ),
          SizedBox(height: 17),


          Text(model.name,
              style: _theme.textTheme.headline6),
          model.user.isAnonymous
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: RaisedButton(
                        child: Text('Login'), onPressed: model.login),
                  ),
                )
              : (model.profile == null
                  ? CircularProgressIndicator()
                  : Expanded(child: UserProfileEditor())),
        ]),
      ),
    );
  }
}

class UserProfileEditor extends ViewModelWidget<DashboardProfileViewModel> {
  @override
  Widget build(BuildContext context, model) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          FormBuilder(
            key: model.fbKey,
            child: Column(children: [
              FormBuilderTextField(
                  attribute: "email",
                  initialValue: model.user.email,
                  decoration: InputDecoration(labelText: "Email Address"),
                  validators: [
                    FormBuilderValidators.email(),
                    FormBuilderValidators.max(150),
                  ]),
              FormBuilderTextField(
                  attribute: "mobile",
                  initialValue: model.user.phoneNumber,
                  decoration: InputDecoration(labelText: "Mobile Number"),
                  readOnly: true,
                  validators: [
//                      FormBuilderValidators.numeric(),
                    FormBuilderValidators.pattern(r'(^\+(?:[+0]9)?[0-9]{12}$)',
                        errorText:
                            'Make sure you include country code. Ex: +919898989898'),
                  ]),
              FormBuilderDropdown(
                attribute: "classGroup",
                decoration: InputDecoration(labelText: "Class"),
                hint: Text('Select Class'),
                initialValue: model.profile.classGroup,
                validators: [FormBuilderValidators.required()],
                items: ['1st - 4th', '5th - 8th', '9th - 10th', '11th - 12th']
                    .map((classGroup) => DropdownMenuItem(
                        value: classGroup, child: Text("$classGroup")))
                    .toList(),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(children: [
              RaisedButton(
                child: Text('Save'),
                onPressed: model.saveProfile,
              ),
              Spacer(),
              RaisedButton(
                child: Text('Logout'),
                onPressed: model.logout,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
