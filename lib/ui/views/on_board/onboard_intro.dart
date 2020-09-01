import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';

class OnboardIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return new Scaffold(
      body: Container(
        margin: getInsetsAll(5),
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
                  style: theme.textTheme.bodyText1.copyWith(
                    fontSize: 18,
                    letterSpacing: 2.5,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('CODING BLOCKS \nJUNIOR',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 31 * SizeConfig.textMultiplier)),
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
                        fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
