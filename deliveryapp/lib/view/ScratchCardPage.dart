import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class ScratchCardPage extends StatelessWidget {
  Future<void> scratchCardDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'You have won: ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            content: Scratcher(
              accuracy: ScratchAccuracy.low,
              brushSize: 40,
              color: Colors.pinkAccent,
              child: Container(
                height: 300,
                width: 300,
                alignment: Alignment.center,
                child: Text('\$5 off your next purchase', 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFFcf40ff),
                ),),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFcf40ff),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.black,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          color: Color(0xFFcf40ff),
          child: Text(
            'Scratch to see your prize',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onPressed: () => scratchCardDialog(context),
        ),
      ),
    );
  }
}
