import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardInterests extends ViewModelWidget<OnBoardViewModel> {
  List<String> reportList = [
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
    return new Scaffold(
      body: Container(
        margin: EdgeInsets.all(5 * SizeConfig.heightMultiplier),
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
                  style: new TextStyle(
                      color: Colors.black,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 2.2 * SizeConfig.textMultiplier)),
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
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(
                    10 * SizeConfig.heightMultiplier,
                    3 * SizeConfig.widthMultiplier,
                    10 * SizeConfig.heightMultiplier,
                    3 * SizeConfig.widthMultiplier),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: getColorFromHex('#2167E3'),
                onPressed: selectedReportList.length > 0
                    ? null
                    : () => model.goToHome(selectedReportList),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
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

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.reportList.forEach((item) {
      bool isItemSelected = selectedChoices.contains(item);
      choices.add(Container(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
        child: ChoiceChip(
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              side: BorderSide(color: getColorFromHex('#2167E3'))),
          label: Text(item,
              style: TextStyle(
                  fontSize: 1.5 * SizeConfig.textMultiplier,
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
    return Wrap(
      alignment: WrapAlignment.center,
      children: _buildChoiceList(),
    );
  }
}
