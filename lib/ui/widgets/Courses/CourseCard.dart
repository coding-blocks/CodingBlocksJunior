import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {
  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool _isExanded = false;

  void onExpandToggle() {
    setState(() {
      _isExanded = !_isExanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(5, 117, 230, 1),
      child: InkWell(
        onTap: onExpandToggle,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Image.network('https://minio.cb.lk/coding-blocks-junior/python-white.png',),
                      ),
                      Text(
                        'Python',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'For Classes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8
                        ),
                      ),
                      Text(
                        '7th - 10th',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (_isExanded) CourseCardExpandedView(),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCardExpandedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: null,
        ),
        Expanded(
          flex: 1,
          child: null,
        ),
      ],
    );
  }
}
