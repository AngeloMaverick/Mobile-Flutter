import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String InfoResult = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      backgroundColor: Colors.white,
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Jogo do Nº aleatório"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _body() {
    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _imageRandomNumber(),
              _textRandomNumber(),
              _buttonGenerateRandomNumber(),
              _resultado(),

            ]));
  }


  _imageRandomNumber() {
    return Image.network(
      'https://w7.pngwing.com/pngs/154/549/png-transparent-riddler-batman-riddler-riddler-circle-green.png',
      height: 150,
      width: 150,
    );
  }

  _textRandomNumber() {
    return Text(
      'Pense em um nº de 0 a 10',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 28.0),
    );
  }


  _buttonGenerateRandomNumber() {
    return Padding(
      padding: EdgeInsets.only(
          top: 20.0,
          bottom: 35.0
      ),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _generateRandomNumber,
          child: Text("Descobrir",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35.0
              )
          ),
          color: Colors.green,
        ),
      ),
    );
  }

  _resultado() {
    return Text(
      InfoResult,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.red,
          fontSize: 35.0,
          decoration: TextDecoration.underline
      ),
    );
  }


  void _generateRandomNumber() {
    setState(() {
      int number = new Random().nextInt(10);
      InfoResult = number.toString();
    });
  }
}