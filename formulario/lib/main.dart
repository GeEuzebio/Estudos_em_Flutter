// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: Formulario()));
}

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _colorWhite = Colors.white;
  final _colorBlack = Colors.black;
  var _themeColor = Colors.white;
  var _textColor = Colors.black;
  var _valor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Formulário de cadastro",
        style: TextStyle(color: _textColor),
      )),
      body: Column(children: <Widget>[
        SwitchListTile(
          value: _valor,
          onChanged: (bool valor) {
            if (valor == false) {
              setState(() {
                _themeColor = _colorWhite;
                _textColor = _colorBlack;
                _valor = valor;
              });
            } else {
              setState(() {
                _themeColor = _colorBlack;
                _textColor = _colorWhite;
                _valor = valor;
              });
            }
          },
          title: Text(
            "Modo escuro",
            style: TextStyle(color: _textColor),
          ),
        ),
        Text(
          "Teste",
          style: TextStyle(
              color: _textColor, fontSize: 25, fontWeight: FontWeight.bold),
        )
      ]),
      backgroundColor: _themeColor,
    );
  }
}

class _Cores {
  _Cores(Color color);
}
