library switch_text_field;

import 'package:flutter/material.dart';

class SwitchTextField extends StatefulWidget {
  /// Background color for the container.
  final Color backgroundColor;

  /// Color for the icon.
  final Color iconColor;

  /// Background color for icon button.
  final Color iconBackgroundColor;

  /// Color for the text.
  final Color textColor;

  /// Font size for the text and text field.
  final double fontSize;

  /// Hint for the text field to be shown at the initial.
  final String textFieldHint;

  /// Icon to be shown along text field.
  final IconData textFieldIcon;

  /// Icon to be shown along uneditable text.
  final IconData textIcon;

  /// initial state of the widget: true means TextField is editable otherwise false means non-editable content.
  final bool isEditing;

  const SwitchTextField(
      {super.key,
      this.backgroundColor = Colors.blue,
      this.iconColor = Colors.white,
      this.iconBackgroundColor = Colors.black,
      this.textColor = Colors.black,
      this.fontSize = 16.0,
      this.textFieldHint = "Edit me",
      this.textFieldIcon = Icons.check,
      this.textIcon = Icons.edit,
      this.isEditing = true});

  @override
  State<SwitchTextField> createState() => _SwitchTextFieldState();
}

class _SwitchTextFieldState extends State<SwitchTextField> {
  /// Edited or shown text.
  String textContent = "";
  final TextEditingController controller = TextEditingController();

  /// current mode of the widget: TextField or Text.
  late bool _isEditing = widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.backgroundColor,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: _isEditing
            ? Row(
                children: [
                  Expanded(
                      flex: 8,
                      child: TextField(
                        showCursor: true,
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: widget.fontSize,
                        ),
                        cursorColor: widget.textColor,
                        controller: controller,
                        onTap: () {
                          setState(() {
                            textContent = controller.text;
                          });
                        },
                        decoration:
                            InputDecoration(hintText: widget.textFieldHint),
                      )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: widget.iconBackgroundColor, // <-- Button color
                    ),
                    child: Icon(
                      widget.textFieldIcon,
                      color: widget.iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        textContent = controller.text;
                        _isEditing = !_isEditing;
                      });
                    },
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      textContent,
                      style: TextStyle(
                          color: widget.textColor, fontSize: widget.fontSize),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: widget.iconBackgroundColor, // <-- Button color
                    ),
                    child: Icon(
                      widget.textIcon,
                      color: widget.iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        controller.text = textContent;
                        _isEditing = !_isEditing;
                      });
                    },
                  ),
                ],
              ));
  }
}
