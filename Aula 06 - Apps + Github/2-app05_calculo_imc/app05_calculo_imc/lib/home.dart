import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();

  String infoResultado = "Informe seu peso e sua altura!";

  void _calc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      double imc = peso / (altura * altura);

      if (imc < 18.5) {
        infoResultado = 'IMC: Abaixo do Peso!';
      } else if ((imc >= 18.5) && (imc <= 24.9)) {
        infoResultado = 'IMC: Peso Ideal!';
      } else if ((imc >= 25) && (imc < 29.9)) {
        infoResultado = 'IMC: Sobrepeso!';
      } else if ((imc >= 30) && (imc < 34.9)) {
        infoResultado = 'IMC: Obesidade Grau I!';
      } else if ((imc >= 35) && (imc < 39.9)) {
        infoResultado = 'IMC: Obesidade Grau II!';
      } else {
        infoResultado = 'IMC: Obesidade Grau III ou Mórbida(a)!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _title() {
    return AppBar(
      title: Text("Cálcule seu IMC!"), //
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _image(),
          _field("Peso", pesoController),
          _field("Altura", alturaController),
          _button(),
          _text(infoResultado),
        ],
      ),
    );
  }

  _field(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: objController,
    );
  }

  _image() {
    return Image.network(
      'https://i0.wp.com/opas.org.br/wp-content/uploads/2017/12/imc-1.jpg?fit=1080%2C300&ssl=1',
      height: 130,
      width: 200,
    );
  }

  _button() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calc,
          child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.green,
        ),
      ),
    );
  }

  _text(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }
}