// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _frases = [
    "Quando estou com você, desejo que o tempo congele para que eu possa decorar cada detalhe seu.",
    "Nunca imaginei encontrar alguém com quem eu tivesse tanta química, tanta cumplicidade e tanto amor. Você é o amor da minha vida!",
    "Eu amo quando você sorri, mas eu amo ainda mais quando eu sou o motivo.",
    "Quero me perder no labirinto dos seus olhos e me encontrar no porto seguro do seu coração.",
    "Você coube tão direitinho dentro do meu coração, que talvez você não tenha formato de gente, mas de amor.",
    "Vou te emprestar meus olhos para você ver a coisa linda que eu vejo quando você sorri.",
    "Eu não acreditava em um amor para a vida toda, até te conhecer!",
    "Eu não me canso de te admirar, te observar na nossa rotina, fazendo as coisas que você faz todos os dias. Até as suas manias são lindas!",
    "Eu te entreguei meu coração e foi a melhor decisão que já tomei na vida.",
    "Você não é o que faltava em mim, é melhor que isso, é o que trouxe complemento para a minha vida."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase romântica!";

  void _gerarFrase() {
    var numeroAleatorio = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroAleatorio];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases Românticas Aleatórias"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/casal.png", fit: BoxFit.scaleDown),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            const Text(
              'Frase romântica aleatória: ',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                _fraseGerada,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            RaisedButton(
              onPressed: _gerarFrase,
              child: const Text("Gerar nova frase"),
            )
          ],
        ),
      ),
    );
  }
}
