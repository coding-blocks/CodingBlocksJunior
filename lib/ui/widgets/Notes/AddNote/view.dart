import 'package:coding_blocks_junior/ui/widgets/Base/RaisedGradientButton.dart';
import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:coding_blocks_junior/models/note.dart';
import 'package:coding_blocks_junior/utils/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddNote extends HookWidget {
  final Function(String) onSave;
  final Note noteToEdit;

  AddNote({@required this.onSave, this.noteToEdit});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _controller = useTextEditingController(text: noteToEdit.text);

    return Container(
      padding: getInsetsAll(20),
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0))),
      height: (
          SizeConfig.isPortrait ?
            MediaQuery.of(context).size.height / 4
              :
            MediaQuery.of(context).size.height / 2.5
      ) * SizeConfig.heightMultiplier + MediaQuery.of(context).viewInsets.bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              margin: getInsetsOnly(
                top: 12,
                left: 12,
                right: 12,
              ),
              child: TextField(
                controller: _controller,
                minLines: 10,
                maxLines: 20,
                style: _theme.textTheme.subtitle2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    contentPadding: getInsetsAll(12.0),
                    fillColor: getColorFromHex('#FAFAFA'),
                    filled: true,
                    hintText: "Enter your text here"),
              ),
            ),
          ),
          Container(
            margin: getInsetsOnly(
              top: 12,
              left: 25,
              right: 25,
            ),
            child: RaisedGradientButton(
              gradient: LinearGradient(colors: [
                getColorFromHex('#0575E6'),
                getColorFromHex('#021B79')
              ]),
              onPressed: () => onSave(_controller.text),
              child: Text(
                'Add Note',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
