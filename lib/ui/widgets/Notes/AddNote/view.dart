import 'package:coding_blocks_junior/ui/widgets/Base/RaisedGradientButton.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Function(String) onSave;
  final Note noteToEdit;

  AddNote({
    @required this.onSave,
    this.noteToEdit
  }) {
    if (this.noteToEdit != null) {
      this._controller.text = this.noteToEdit.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0))),
      height: SizeConfig.isPortrait
          ? MediaQuery.of(context).size.height / 3.5 +
              MediaQuery.of(context).viewInsets.bottom
          : MediaQuery.of(context).size.height / 3 +
              MediaQuery.of(context).viewInsets.bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 12 * SizeConfig.heightMultiplier,
              left: 12 * SizeConfig.widthMultiplier,
              right: 12 * SizeConfig.widthMultiplier,
            ),
            child: TextField(
              controller: _controller,
              minLines: 3,
              maxLines: 8,
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Colors.black,
                fontSize: 12 * SizeConfig.textMultiplier
              ),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12.0),
                  fillColor: getColorFromHex('#FAFAFA'),
                  filled: true,
                  hintText: "Enter your text here"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 12 * SizeConfig.heightMultiplier,
              left: 25 * SizeConfig.widthMultiplier,
              right: 25 * SizeConfig.widthMultiplier,
            ),
            child: RaisedGradientButton(
              height: 35 * SizeConfig.heightMultiplier,
              gradient: LinearGradient(colors: [
                getColorFromHex('#0575E6'),
                getColorFromHex('#021B79')
              ]),
              onPressed: () => onSave(_controller.text),
              child: Text(
                'Add Note',
                style: _theme.textTheme.button,
              ),
            ),
          )
        ],
      ),
    );
  }
}
