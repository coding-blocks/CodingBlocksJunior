import 'package:coding_blocks_junior/utils/HexToColor.dart';
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1.0)
      ),
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextField(
              controller: _controller,
              maxLines: 8,
              decoration: InputDecoration.collapsed(
                fillColor: getColorFromHex('#FAFAFA'),
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
