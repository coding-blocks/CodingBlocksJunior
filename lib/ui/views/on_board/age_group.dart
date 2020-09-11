import 'package:coding_blocks_junior/models/radio.dart';
import 'package:coding_blocks_junior/ui/views/on_board/viewmodel.dart';
import 'package:coding_blocks_junior/ui/widgets/Base/ClassPill.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';

class OnboardAgeGroup extends ViewModelWidget<OnBoardViewModel> {

  @override
  Widget build(BuildContext context, OnBoardViewModel model) {
    final theme = Theme.of(context);
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
              flex: 1,
            ),
            Container(
              margin: getInsetsOnly(bottom: 12),
              child: Text('Which Grade are you in?',
                  style: theme.textTheme.headline6),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 10.0,
                  alignment: WrapAlignment.spaceEvenly,
                  direction: Axis.horizontal,
                  children: List.generate(model.sampleData.length, (index) {
                    return new InkWell(
                      //highlightColor: Colors.red,
                      splashColor: Colors.white,
                      onTap: () {
                        model.saveClass(index);
                      },
                      child: ConstrainedBox(
                          constraints: SizeConfig.isPortrait
                              ? BoxConstraints(maxWidth: 900)
                              : BoxConstraints(
                                  maxWidth: 300 * SizeConfig.widthMultiplier),
                          child: new RadioItem(model.sampleData[index])),
                    );
                  }),
                ),
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
    final theme = Theme.of(context);
    return new Container(
      decoration: new BoxDecoration(
        color: getColorFromHex('#2167E3'),
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
      ),
      margin: getInsetsLTRB(30, 4, 30, 4),
      padding: getInsetsAll(16),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            child: new Center(
              child: new Text(_item.text,
                  style:
                      theme.textTheme.bodyText1.copyWith(color: Colors.white)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: getInsetsLTRB(15, 0, 15, 0),
              child: Row(
                children: _item.classes
                    .map((classPill) => Container(
                          margin: getInsetsLTRB(0, 0, 5, 0),
                          child: ClassPill(
                            klass: classPill.text,
                            color: classPill.color,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Visibility(
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
