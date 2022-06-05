library switch_text_field;

import 'package:flutter/material.dart';

class SwitchTextField extends StatefulWidget {
  const SwitchTextField({Key? key}) : super(key: key);

  @override
  State<SwitchTextField> createState() => _SwitchTextFieldState();
}

class _SwitchTextFieldState extends State<SwitchTextField> {
  String content = "";
  bool open = true;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: open
            ? Row(
                children: [
                  Expanded(
                      flex: 8,
                      child: TextField(
                        controller: controller,
                        onTap: () {
                          setState(() {
                            content = controller.text;
                            print(content);
                          });
                        },
                        decoration: InputDecoration(hintText: "Try me"),
                      )),
                  ElevatedButton(
                    child: Icon(Icons.check, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                    onPressed: () {
                      print("123");
                      setState(() {
                        content = controller.text;
                        open = !open;
                      });
                      print(content);
                    },
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(flex: 3, child: Text(content)),
                  ElevatedButton(
                    child: Icon(Icons.edit, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(0),
                      primary: Colors.blue, // <-- Button color
                      // onPrimary: Colors.red, // <-- Splash color
                    ),
                    onPressed: () {
                      print("123");
                      setState(() {
                        controller.text = content;
                        open = !open;
                      });
                      print(content);
                    },
                  ),
                ],
              ));
  }
}
