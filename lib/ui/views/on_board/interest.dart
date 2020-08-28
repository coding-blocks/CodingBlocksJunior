import 'package:coding_blocks_junior/ui/views/on_board/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/RaisedGradientButton.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class OnboardInterests extends StatefulWidget {
  @override
  createState() {
    return new OnboardInterestsState();
  }
}

class OnboardInterestsState extends State<OnboardInterests> {
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
  Widget build(BuildContext context) {
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
            Text('What are you interested in?',
                style: new TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 2.2 * SizeConfig.textMultiplier)),
            Container(
              alignment: Alignment.center,
              child: MultiSelectChip(
                reportList,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedReportList = selectedList;
                  });
                },
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: getColorFromHex('#2167E3'),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 2 * SizeConfig.textMultiplier,
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
      choices.add(Container(
        padding: const EdgeInsets.only(left: 2.0,right: 2.0),
        child: ChoiceChip(
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          label: Text(item,
              style: TextStyle(
                  fontSize: 1.5 * SizeConfig.textMultiplier,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          selected: selectedChoices.contains(item),
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
      children: _buildChoiceList(),
    );
  }
}
