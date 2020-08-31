import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class OnboardIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        margin: EdgeInsets.all(25 * SizeConfig.heightMultiplier),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/onboarding-1.png'),
              ),
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: new Text('HEY, WELCOME TO',
                  style: new TextStyle(
                      letterSpacing: 2.5,
                      color: Colors.black,
                      fontFamily: 'Gilroy',
                      fontSize: 14 * SizeConfig.textMultiplier)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('CODING BLOCKS \nJUNIOR',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.black,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 24 * SizeConfig.textMultiplier)),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                ),
                Text('Swipe',
                    textAlign: TextAlign.right,
                    style: new TextStyle(
                        color: Colors.black,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        fontSize: 12 * SizeConfig.textMultiplier)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
