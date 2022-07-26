import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCep = TextEditingController();
  TextEditingController _controllerLogradouro = TextEditingController();
  TextEditingController _controllerLocalidade = TextEditingController();
  TextEditingController _controllerUF = TextEditingController();

  String _logradouro = '';
  String _complemento = '';
  String _bairro = '';
  String _localidade = '';
  String _uf = '';
  List _cep = [];
  int count = 0;

  _consultaCEP() async {
    String cep = _controllerCep.text;
    var url = Uri.https('viacep.com.br', '/ws/${cep}/json/');

    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> resultado = jsonDecode(response.body);

    String logradouro = resultado['logradouro'];
    String complemento = resultado['complemento'];
    String bairro = resultado['bairro'];
    String localidade = resultado['localidade'];
    String uf = resultado['uf'];

    setState(() {
      _logradouro = logradouro;
      _complemento = complemento;
      _bairro = bairro;
      _localidade = localidade;
      _uf = uf;
    });
  }

  _consultaLogradouro() async {
    String logradouro = _controllerLogradouro.text;
    String localidade = _controllerLocalidade.text;
    String uf = _controllerUF.text;
    var url = Uri.https(
        'viacep.com.br', '/ws/${uf}/${localidade}/${logradouro}/json/');

    http.Response response;

    response = await http.get(url);
    List<dynamic> resultado = jsonDecode(response.body);

    setState(() {
      _cep = resultado;
      count = resultado.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white30,
          appBar: AppBar(
              backgroundColor: Colors.white10,
              title: Text(''),
              bottom: TabBar(
                tabs: <Widget>[Text('Busca de CEP'), Text('Busca de Endereço')],
              )),
          body: TabBarView(children: <Widget>[
            SingleChildScrollView(
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('img/Busca.png'),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                          child: TextField(
                            controller: _controllerCep,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Digite o CEP',
                                fillColor: Colors.white,
                                filled: true),
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                          child: ElevatedButton(
                            onPressed: _consultaCEP,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Consulta',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                              child: Text(
                                'Logradouro: ${_logradouro}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                              child: Text('Complemento: ${_complemento}',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                              child: Text('Bairro: ${_bairro}',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                              child: Text('Localidade: ${_localidade}',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                              child: Text('UF: ${_uf}',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            )
                          ],
                        )
                      ],
                    ))),
            SingleChildScrollView(
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('img/Endereco.png'),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                          child: TextField(
                            controller: _controllerLogradouro,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Digite o logradouro',
                                fillColor: Colors.white,
                                filled: true),
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                          child: TextField(
                            controller: _controllerLocalidade,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Digite a localidade',
                                fillColor: Colors.white,
                                filled: true),
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                          child: TextField(
                            controller: _controllerUF,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Digite a UF',
                                fillColor: Colors.white,
                                filled: true),
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                          child: ElevatedButton(
                            onPressed: _consultaLogradouro,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Consulta',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                                height: 400,
                                child: ListView.builder(
                                    itemCount: count,
                                    itemBuilder: (context, int i) {
                                      return Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              16, 30, 16, 0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Logradouro: ${_cep[i]['logradouro']}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'Complemento: ${_cep[i]['complemento']}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'Bairro: ${_cep[i]['bairro']}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'CEP: ${_cep[i]['cep']}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                'UF: ${_cep[i]['uf']}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ));
                                    })),
                          ],
                        )
                      ],
                    )))
          ]),
        ));
  }
}
