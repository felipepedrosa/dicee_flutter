import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Dicee',
      home: DicePage(),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var _leftDiceNumber = 1;
  var _rightDiceNumber = 1;

  /// Generates random numbers for dices.
  int _getRandomNumber() {
    return Random().nextInt(6) + 1;
  }

  /// Handle user clicks on dices.
  void _handleDiceClick() {
    setState(() {
      _leftDiceNumber = _getRandomNumber();
      _rightDiceNumber = _getRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Starting dices with random numbers.
    _handleDiceClick();

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      title: 'Dicee',
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dicee'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Informações'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Desenvolvedor: Felipe Pedrosa'),
                      Text('Email: felipeepedrosa@gmail.com'),
                      Text('Github: felipepedrosa'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () => _handleDiceClick(),
                  child: Image.asset('images/dice$_leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _handleDiceClick(),
                  child: Image.asset('images/dice$_rightDiceNumber.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
