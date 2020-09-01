import 'package:coding_blocks_junior/ui/views/on_board/viewmodel.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardInterests extends ViewModelWidget<OnBoardViewModel> {
  final List<String> reportList = [
    "Cricket",
    "App Development",
    "Video Games",
    "Web Development",
    "Robots",
    "Maths and Science"
  ];
  List<String> selectedReportList = List();

  @override
  Widget build(BuildContext context, OnBoardViewModel model) {
    final theme = Theme.of(context);
    return new Scaffold(
      body: Container(
        margin: getInsetsAll(5),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/onboarding-2.png'),
              ),
              flex: 2,
            ),
            Container(
              padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
              child: Text('What are you interested in?',
                  style: theme.textTheme.headline6),
            ),
            Container(
              padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
              alignment: Alignment.center,
              child: MultiSelectChip(
                reportList,
                onSelectionChanged: (selectedList) {
                  selectedReportList = selectedList;
                },
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              margin: getInsetsLTRB(0, 50, 0, 0),
              padding: getInsetsLTRB(30, 0, 30, 0),
              child: RaisedButton(
                padding: getInsetsLTRB(10, 3, 10, 3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: getColorFromHex('#2167E3'),
                onPressed: selectedReportList.length > 0
                    ? null
                    : () => model.goToHome(selectedReportList),
                child: Text(
                  'Get Started',
                  style: theme.textTheme.bodyText1.copyWith(
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList(ThemeData theme) {
    List<Widget> choices = List();

    widget.reportList.forEach((item) {
      bool isItemSelected = selectedChoices.contains(item);
      choices.add(Container(
        padding: getInsetsLTRB(2, 0, 2, 0),
        child: ChoiceChip(
          padding: getInsetsAll(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              side: BorderSide(color: getColorFromHex('#2167E3'))),
          label: Text(item,
              style: theme.textTheme.caption.copyWith(
                  color: isItemSelected
                      ? Colors.white
                      : getColorFromHex('#2167E3'),
                  fontWeight: FontWeight.bold)),
          selected: isItemSelected,
          backgroundColor: Colors.white,
          selectedColor: getColorFromHex('#2167E3'),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      alignment: WrapAlignment.center,
      children: _buildChoiceList(theme),
    );
  }
}
