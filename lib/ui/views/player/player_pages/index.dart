import 'package:flutter/material.dart';


class PlayerPagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(children: [
            Align(child: Text('Live Chat'), alignment: Alignment.topLeft,),
            Image.network("http://www.cutestpaw.com/wp-content/uploads/2016/02/Playing-on-mom..jpg")
      ]),
          Column(children: [
            Text('Notes'),
            Image.network("http://www.cutestpaw.com/wp-content/uploads/2016/06/s-1465687616158-270458018.jpg")
          ])
        ],
      ),
    );
  }
}
