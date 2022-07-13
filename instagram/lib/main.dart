import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MaterialApp(
    home: Instagram(),
    debugShowCheckedModeBanner: false,
  ));
}

class Instagram extends StatefulWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DropdownButtonHideUnderline(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 0, 10),
                child: DropdownButton2(
                  customButton: Container(
                    width: 140,
                    height: 55,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Instagram',
                            style: TextStyle(
                                fontFamily: 'Billabong', fontSize: 36),
                          ),
                          Icon(Icons.expand_more_outlined)
                        ],
                      ),
                    ),
                  ),
                  value: 'Seguindo',
                  items: [
                    DropdownMenuItem(
                      child: Text('Seguindo'),
                      value: 'Seguindo',
                    ),
                    DropdownMenuItem(
                      child: Text('Favoritos'),
                      value: 'Favoritos',
                    )
                  ],
                  icon: const Icon(Icons.expand_more_outlined),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(Icons.add_box_outlined),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Icon(Icons.favorite_border_outlined),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(Icons.near_me_outlined),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'images/mario_story.png',
                              fit: BoxFit.contain,
                            )),
                        Text('Mario',
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'images/peach_story.png',
                              fit: BoxFit.contain,
                            )),
                        Text('Princess Peach',
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'images/luigi_story.png',
                              fit: BoxFit.contain,
                            )),
                        Text('Luigi',
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'images/daisy_story.png',
                              fit: BoxFit.contain,
                            )),
                        Text('Princess Daisy',
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'images/toad_story.png',
                              fit: BoxFit.contain,
                            )),
                        Text('Toad',
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'images/bowser_story.png',
                              fit: BoxFit.contain,
                            )),
                        Text('Bowser',
                            style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  )
                ],
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
              height: 480,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                          'images/mario_story.png')),
                                  Text('Mario')
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                child: Image.asset('images/post_1.png'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child: Icon(
                                            Icons.favorite_border_outlined),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child:
                                            Icon(Icons.mode_comment_outlined),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child: Icon(Icons.near_me_outlined),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.turned_in_not)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                    child: Text(
                                      'Mario',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text('It\'s me, Mario!'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                          'images/luigi_story.png')),
                                  Text('Luigi')
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                child: Image.asset('images/post_2.png'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child: Icon(
                                            Icons.favorite_border_outlined),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child:
                                            Icon(Icons.mode_comment_outlined),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child: Icon(Icons.near_me_outlined),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.turned_in_not)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                    child: Text(
                                      'Luigi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text('Super Mario Brothers!'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                          'images/peach_story.png')),
                                  Text('Princess Peach')
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                child: Image.asset('images/post_3.png'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child: Icon(
                                            Icons.favorite_border_outlined),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child:
                                            Icon(Icons.mode_comment_outlined),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 0),
                                        child: Icon(Icons.near_me_outlined),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.turned_in_not)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                    child: Text(
                                      'Princess Peach',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text('A kiss!'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.home_filled),
              Icon(Icons.search_outlined),
              Icon(Icons.smart_display_outlined),
              Icon(Icons.shopping_bag_outlined),
              Container(
                width: 30,
                height: 30,
                child: Image.asset('images/mario_story.png'),
              )
            ],
          )),
    );
  }
}
