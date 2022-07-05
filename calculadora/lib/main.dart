import 'dart:ffi';
import 'dart:io';

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calc(),
  ));
}

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String _mostrador = '0';
  String _memory = '';
  String _AC = "AC";
  String _operacao = "";
  String _auxiliar = "";

  void digitar(String valor) {
    if ((_mostrador == '0' ||
            double.parse(_mostrador) > 0 && _auxiliar == 'null') &&
        valor != ".") {
      setState(() {
        _mostrador = valor;
        _auxiliar = "";
      });
    } else if (_mostrador.contains(".") && valor != "." ||
        !_mostrador.contains(".") && valor == "." ||
        !_mostrador.contains(".") && valor != ".") {
      setState(() {
        _mostrador = _mostrador + valor;
      });
    }
  }

  void Clear() {
    if (_AC == "C") {
      setState(() {
        _mostrador = "0";
        _AC = "AC";
      });
    } else if (_AC == "AC") {
      setState(() {
        _memory = "";
        _mostrador = "0";
        _operacao = "";
      });
    }
  }

  void operar(String operacao) {
    if (_memory == "") {
      setState(() {
        _memory = _mostrador;
        _operacao = operacao;
        _mostrador = "0";
      });
    } else {
      igual(_operacao);
      setState(() {
        _operacao = operacao;
        _memory = _mostrador;
        _mostrador = "0";
      });
    }
  }

  void igual(_operacao) {
    if (_memory != "") {
      switch (_operacao) {
        case "adicao":
          if (!_mostrador.contains(".") && !_memory.contains(".")) {
            setState(() {
              _mostrador =
                  (int.parse(_mostrador) + int.parse(_memory)).toString();
              _memory = "";
              _auxiliar = "null";
            });
          } else {
            setState(() {
              _mostrador = (double.parse(_mostrador) + double.parse(_memory))
                  .toStringAsPrecision(4);
              _memory = "";
              _auxiliar = "null";
            });
          }
          break;
        case "subtracao":
          if (!_mostrador.contains(".") && !_memory.contains(".")) {
            setState(() {
              _mostrador =
                  (int.parse(_memory) - int.parse(_mostrador)).toString();
              _memory = "";
              _auxiliar = "null";
            });
          } else {
            setState(() {
              _mostrador = (double.parse(_memory) - double.parse(_mostrador))
                  .toStringAsPrecision(4);
              _memory = "";
              _auxiliar = "null";
            });
          }
          break;
        case "multiplicacao":
          if (!_mostrador.contains(".") && !_memory.contains(".")) {
            setState(() {
              _mostrador =
                  (int.parse(_memory) * int.parse(_mostrador)).toString();
              _memory = "";
              _auxiliar = "null";
            });
          } else {
            setState(() {
              _mostrador = (double.parse(_mostrador) * double.parse(_memory))
                  .toStringAsPrecision(4);
              _memory = "";
              _auxiliar = "null";
            });
          }
          break;
        case "divisao":
          if (!_mostrador.contains(".") && !_memory.contains(".")) {
            setState(() {
              _mostrador =
                  (int.parse(_memory) / int.parse(_mostrador)).toString();
              _memory = "";
              _auxiliar = "null";
            });
          } else {
            setState(() {
              _mostrador = (double.parse(_memory) / double.parse(_mostrador))
                  .toStringAsPrecision(4);
              _memory = "";
              _auxiliar = "null";
            });
          }
          break;
        case "porcentagem":
          if (_memory == "" && _mostrador == "") {}
          setState(() {
            _mostrador =
                ((double.parse(_memory) / 100) * double.parse(_mostrador))
                    .toStringAsPrecision(4);
          });
          break;
      }
    } else if (_memory == "") {
      setState(() {
        _mostrador = "0";
      });
    }
  }

  void plusMinus() {
    setState(() {
      _mostrador = (int.parse(_mostrador) * (-1)).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(this._memory, style: TextStyle(fontSize: 30)),
                    ),
                    Text(
                      this._mostrador,
                      style: TextStyle(fontSize: 35),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 10, 10),
                    child: ElevatedButton(
                      onPressed: () => Clear(),
                      child: Text(
                        _AC,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlueAccent),
                          minimumSize: MaterialStateProperty.all(Size(80, 70))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => plusMinus(),
                        child: Text("+/-",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.lightBlueAccent),
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => operar("porcentagem"),
                        child: Text("%",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.lightBlueAccent),
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: ElevatedButton(
                        onPressed: () => operar("divisao"),
                        child: Text("/",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 10, 10),
                    child: ElevatedButton(
                      onPressed: () => digitar("1"),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(80, 70))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => digitar("2"),
                        child: Text("2",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => digitar("3"),
                        child: Text("3",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: ElevatedButton(
                        onPressed: () => operar("subtracao"),
                        child: Text("-",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 10, 10),
                    child: ElevatedButton(
                      onPressed: () => digitar("4"),
                      child: Text(
                        "4",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(80, 70))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => digitar("5"),
                        child: Text("5",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => digitar("6"),
                        child: Text("6",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: ElevatedButton(
                        onPressed: () => operar("multiplicacao"),
                        child: Text("*",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 10, 10),
                    child: ElevatedButton(
                      onPressed: () => digitar("7"),
                      child: Text(
                        "7",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(80, 70))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => digitar("8"),
                        child: Text("8",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => digitar("9"),
                        child: Text("9",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: ElevatedButton(
                        onPressed: () => operar("adicao"),
                        child: Text("+",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => digitar("0"),
                        child: Text("0",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(180, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                        onPressed: () => digitar("."),
                        child: Text(".",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: ElevatedButton(
                        onPressed: () => igual(_operacao),
                        child: Text("=",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 70)))),
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
