import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemInicial = AssetImage("images/vazio.png");
  var _resultado = "Escolha uma opção abaixo:";

  void jokenpo(String escolhaUsuario) {
    var escolhas = ["pedra", "papel", "tesoura"];
    var numeroAleatorio = Random().nextInt(escolhas.length);
    var escolhaApp = escolhas[numeroAleatorio];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemInicial = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemInicial = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemInicial = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        _resultado = "Você venceu, Parabéns! Escolha uma nova opção:";
      });
    } else if (escolhaUsuario == escolhaApp) {
      setState(() {
        _resultado = "Houve um empate! Escolha uma nova opção:";
      });
    } else {
      setState(() {
        _resultado = "Você perdeu! Tente novamente: ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokenpo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              "Escolha do app:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Image(image: this._imagemInicial),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(this._resultado,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () => jokenpo("pedra"),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Image.asset(
                    'images/pedra.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => jokenpo("papel"),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Image.asset(
                    'images/papel.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => jokenpo("tesoura"),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 20, 30),
                  child: Image.asset(
                    'images/tesoura.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          const Text("Resultado do jogo.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
