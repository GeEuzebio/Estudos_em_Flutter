import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AlcoolGasolina(),
  ));
}

class AlcoolGasolina extends StatefulWidget {
  const AlcoolGasolina({Key? key}) : super(key: key);

  @override
  State<AlcoolGasolina> createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _resposta = "";

  void _calcular() {
    String alcool = _controllerAlcool.text;
    String gasolina = _controllerGasolina.text;

    if (alcool.contains(",")) {
      setState(() {
        alcool = _controllerAlcool.text.replaceAll(RegExp(r','), '.');
      });
    }

    if (gasolina.contains(",")) {
      setState(() {
        gasolina = _controllerGasolina.text.replaceAll(RegExp(r','), '.');
      });
    }

    double resultado = double.parse(alcool) / double.parse(gasolina);

    if (alcool != 0 && gasolina != 0) {
      if (resultado >= 0.7) {
        setState(() {
          _resposta = "Melhor abastecer com Gasolina!";
        });
      } else {
        setState(() {
          _resposta = "Melhor abastecer com Álcool!";
        });
      }
    } else {
      setState(() {
        _resposta = "Os preços não podem ser nulos!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Álcool ou Gasolina")),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Álcool, ex: 1,79."),
                  controller: _controllerAlcool,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina, ex: 5,63."),
                  controller: _controllerGasolina,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: ElevatedButton(
                    onPressed: () => _calcular(), child: Text("Calcular")),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  _resposta,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ]),
      ),
    );
  }
}
