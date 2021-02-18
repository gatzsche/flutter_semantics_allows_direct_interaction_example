import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Allows Direct Interaction Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DrumPad());
  }
}

class DrumPad extends StatefulWidget {
  DrumPad({Key key}) : super(key: key);

  @override
  _DrumPadState createState() => _DrumPadState();
}

class _DrumPadState extends State<DrumPad> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      // The widget should switch from red to white without delay,
      // also when voice over or talk back is enabled. Currently I didn't
      // find any way to achieve that.

      // Therefore I propose a flag called:
      // allowsDirectInteraction: true

      // If this flag is enabled, interactions with the widgets behave the same
      // way, no matter if voice over or talk back is enabled or not.
      child: Listener(
        onPointerDown: (_) => setState(() => _isOn = true),
        onPointerUp: (_) => setState(() => _isOn = false),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: _isOn ? Colors.white : Colors.red,
          ),
        ),
      ),
    );
  }
}
