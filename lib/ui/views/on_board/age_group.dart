import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class OnboardAgeGroup extends StatefulWidget {

  @override
  createState() {
    return new OnboardAgeGroupState();
  }
}

class OnboardAgeGroupState extends State<OnboardAgeGroup> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(false, 'Foundation', ["1", "2" "3"]));
    sampleData.add(new RadioModel(false, 'Junior', ["4", "5", "6"]));
    sampleData.add(new RadioModel(false, 'Middle', ["7", "8", "9", "10"]));
    sampleData.add(new RadioModel(false, 'Senior', ["11", "12"]));
  }

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
            Text('Which Grade are you in?',
                style: new TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 2.2 * SizeConfig.textMultiplier)),
            Expanded(
              flex: 2,
              child: new ListView.builder(
                itemCount: sampleData.length,
                itemBuilder: (BuildContext context, int index) {
                  return new InkWell(
                    //highlightColor: Colors.red,
                    splashColor: Colors.white,
                    onTap: () {
                      setState(() {
                        sampleData
                            .forEach((element) => element.isSelected = false);
                        sampleData[index].isSelected = true;

                      });
                    },
                    child: new RadioItem(sampleData[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: getColorFromHex('#2167E3'),
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
      ),
      margin: new EdgeInsets.fromLTRB(0, 8, 0, 8),
      padding: new EdgeInsets.all(16.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            child: new Center(
              child: new Text(_item.text,
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 2.0 * SizeConfig.textMultiplier)),
            ),
          ),
          Expanded(
            flex: 1,
            child: new ListView.builder(
              shrinkWrap: true, //Added
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return new Text('abc');
              },
            ),
          ),
          Spacer(),
          new Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: _item.isSelected,
            child: new Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String text;
  final List<String> classes;

  RadioModel(this.isSelected, this.text, this.classes);
}
