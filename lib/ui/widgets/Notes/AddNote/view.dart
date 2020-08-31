import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Function(String) onSave;

  AddNote({
    @required this.onSave
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextField(
              controller: _controller,
              maxLines: 5,
             decoration: InputDecoration.collapsed(
               filled: true,
               hintText: "Enter your text here"
             ),
            ),
          ),
          RaisedButton(
            onPressed: () => onSave(_controller.text),
            child: Text('Add Note'),
          )
        ],
      ),
    );
  }
}
