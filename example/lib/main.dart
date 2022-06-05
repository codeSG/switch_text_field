import 'package:flutter/material.dart';
import 'package:switch_text_field/switch_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Switch Text Field Examples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchTextField(),
            SizedBox(
              height: 30,
            ),
            SwitchTextField(
              background_color: Colors.black,
              icon_color: Colors.black,
              icon_background_color: Colors.white,
              text_color: Colors.white,
              isEditing: false,
              text_icon: Icons.cancel_outlined,
              text_field_icon: Icons.add,
              text_field_hint: "Enter title... ",
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
