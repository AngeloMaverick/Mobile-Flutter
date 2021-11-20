import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasController = TextEditingController();

  String infoResult = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _title(),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _title() {
    return AppBar(
      title: Text("Álcool ou Gasolina"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          _image(),
          _field("Preço do Álcool:", alcoolController),
          _field("Preço da Gasolina:", gasController),
          _button(),
          _text(infoResult),
        ],
      ),
    );
  }

  _image(){
    return Center(
      child: Image.network(
        'http://claudiotognolli.com.br/wp-content/uploads/2018/06/adesivo-bomba-combustivel-assalto-preco-alto-alcool-gasolina-D_NQ_NP_808180-MLB26490431904_122017-F-640x459.jpg',
        height: 150,
        width: 150,
      ),
    );
  }

  _field(labelTitulo, objController){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo,
          labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.grey,
          fontSize: 25.0),
      controller: objController,
    );
  }

  _button(){
    return Padding(
      padding: EdgeInsets.only(
          top: 20.0,
          bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcPrice,
          child: Text("Verificar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0)),
          color: Colors.blue,
        ),
      ),
    );
  }

  _text(showText){
    return Text(
        showText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.green,
            fontSize: 25.0)
    );
  }

  _calcPrice(){
    setState(() {
      double gas = double.parse(gasController.text);
      double alcool = double.parse(alcoolController.text);

      if ( (alcool/gas) <= 0.7)
      {
        infoResult = 'Álcool está mais vantajoso!!!';
      }
      else{
        infoResult = ( 'Gasolina está mais vantajoso!!!');
      }
    });
  }
}