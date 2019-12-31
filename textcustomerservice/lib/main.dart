import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import './testDB.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text to Order',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future speak(String text) async {
      await flutterTts.setLanguage('en-US');

      if(db.containsKey(text)) {
      await flutterTts.speak(db[text]);
      }

    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: textEditingController,
          ),
          RaisedButton(
            child: Text('Press to activate options'),
            onPressed: () => speak(textEditingController.text),
          ),
        ],
      ),
    );
  }
}