library switch_text_field;

import 'package:flutter/material.dart';

class SwitchTextField extends StatefulWidget {
  // Background color for the container.
  final Color background_color;
  // Color for the icon.
  final Color icon_color;
  // Background color for icon button.
  final Color icon_background_color;
  // Color for the text.
  final Color text_color;

  // Font size for the text and text field.
  final double font_size;

  // Hint for the text field to be shown at the initial.
  final String text_field_hint;
  // Icon to be shown along text field.
  final IconData text_field_icon;
  //Icon to be shown along uneditable text.
  final IconData text_icon;

  // Current state of the widget: true means TextField is editable otherwise false means non-editable content.
  final bool isEditing;

  const SwitchTextField(
      {this.background_color = Colors.blue,
      this.icon_color = Colors.white,
      this.icon_background_color = Colors.black,
      this.text_color = Colors.black,
      this.font_size = 16.0,
      this.text_field_hint = "Edit me",
      this.text_field_icon = Icons.check,
      this.text_icon = Icons.edit,
      this.isEditing = true});

  @override
  State<SwitchTextField> createState() => _SwitchTextFieldState();
}

class _SwitchTextFieldState extends State<SwitchTextField> {
  // Edited or shown text.
  String textContent = "";
  final TextEditingController controller = TextEditingController();

  late bool _isEditing = widget.isEditing;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: widget.background_color,
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
                            color: widget.text_color,
                            fontSize: widget.font_size,
                            textBaseline: TextBaseline.alphabetic),
                        cursorColor: widget.text_color,
                        controller: controller,
                        onTap: () {
                          setState(() {
                            textContent = controller.text;
                          });
                        },
                        decoration:
                            InputDecoration(hintText: widget.text_field_hint),
                      )),
                  ElevatedButton(
                    child:
                        Icon(widget.text_field_icon, color: widget.icon_color),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: widget.icon_background_color, // <-- Button color
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
                          color: widget.text_color, fontSize: widget.font_size),
                    ),
                  ),
                  ElevatedButton(
                    child: Icon(widget.text_icon, color: widget.icon_color),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: widget.icon_background_color, // <-- Button color
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
