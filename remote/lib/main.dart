import 'package:flutter/material.dart';
import 'package:remote/mydataprovider.dart';
import 'package:provider/provider.dart';
import 'package:remote/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyDataProvider(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'trick'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  Future<dynamic> _read(String dkey) async {
    final prefs = await SharedPreferences.getInstance();

    final dynamic value = prefs.get(dkey) ?? null;
    return value;
  }

  _save(String dkey, int value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt(dkey, value);
  }

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Alignment haa = Alignment.centerLeft;
  double left = 2;
  double right = 2;

  bool momkin = true;

  Container _card1 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container _card2 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container _card3 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container _card4 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container _card5 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container _card6 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container _card7 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container _card8 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container _card9 = Container(
    child: Image.asset('assets/images/0.jpg'),
    key: ValueKey(0),
  );

  Container getCard(int cardNum) {
    return Container(
      child: Image.asset('assets/images/$cardNum.jpg'),
      key: ValueKey(cardNum),
    );
  }

  bool isVibrate = true;
  showSettings(BuildContext context) {
    Provider.of<MyDataProvider>(context).setvisible(true);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsPadding: EdgeInsets.all(10),
            actions: [
              InkWell(
                child: Text('Close'),
                onTap: () {
                  Provider.of<MyDataProvider>(context).setvisible(false);
                  Navigator.pop(context, false);
                  isVibrate = !isVibrate;
                },
              )
            ],
            title: Text('Settings'),
            content: Settings(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Stack(
        children: [
          Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 3.6 / 100,
            child: Container(
                alignment: haa,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    left: Provider.of<MyDataProvider>(context).getleft(),
                    right: Provider.of<MyDataProvider>(context).getright()),
                child: Icon(
                  Icons.ac_unit,
                  size: Provider.of<MyDataProvider>(context).getsize(),
                  color: Colors.black,
                )),
          ),
          Visibility(
            visible: Provider.of<MyDataProvider>(context).getvisile(),
            child: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width -
                      Provider.of<MyDataProvider>(context).getright()),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 3.6 / 100,
            ),
          ),
          Visibility(
            visible: Provider.of<MyDataProvider>(context).getvisile(),
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.yellow,
              width: Provider.of<MyDataProvider>(context).getleft(),
              height: MediaQuery.of(context).size.height * 3.6 / 100,
            ),
          ),
        ],
      ),
      Card(
        elevation: 10,
        color: Colors.blue,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Container(
          height: 64,
          width: 2000,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 14, left: 16),
          child: Text(
            'Trick !!',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                fontFamily: 'RobotoMono'),
          ),
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 200,
          child: GestureDetector(
            onHorizontalDragUpdate: (d) {
              if (d.delta.distance == 8.0) showSettings(context);
            },
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.only(top: 20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              children: <Widget>[
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card1,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card1.key == ValueKey(0)) {
                          if (momkin) {
                            _card1 = getCard(1);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 100], amplitude: 1);
                          } else
                            haa = Alignment.topLeft;
                          _card1 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card2,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card2.key == ValueKey(0)) {
                          if (momkin) {
                            _card2 = getCard(2);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 100, 600, 100], amplitude: 1);
                          } else
                            haa = Alignment.topCenter;
                          _card2 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card3,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card3.key == ValueKey(0)) {
                          if (momkin) {
                            _card3 = getCard(3);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 100, 600, 100, 600, 100],
                                amplitude: 1);
                          } else
                            haa = Alignment.topRight;

                          _card3 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card4,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card4.key == ValueKey(0)) {
                          if (momkin) {
                            _card4 = getCard(4);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 300], amplitude: 1);
                          } else
                            haa = Alignment.centerLeft;

                          _card4 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card5,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card5.key == ValueKey(0)) {
                          if (momkin) {
                            _card5 = getCard(5);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 300, 1000, 300], amplitude: 1);
                          } else
                            haa = Alignment.center;

                          _card5 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card6,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card6.key == ValueKey(0)) {
                          if (momkin) {
                            _card6 = getCard(6);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 300, 1000, 300, 1000, 300],
                                amplitude: 1);
                          } else
                            haa = Alignment.centerRight;

                          _card6 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card7,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card7.key == ValueKey(0)) {
                          if (momkin) {
                            _card7 = getCard(7);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 600], amplitude: 1);
                          } else
                            haa = Alignment.bottomLeft;

                          _card7 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card8,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card8.key == ValueKey(0)) {
                          if (momkin) {
                            _card8 = getCard(8);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 600, 1000, 600], amplitude: 1);
                          } else
                            haa = Alignment.bottomCenter;

                          _card8 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
                GestureDetector(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: _card9,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                            alignment: Alignment.centerLeft,
                          );
                        }),
                    onTap: () {
                      setState(() {
                        print('clicked');

                        if (_card9.key == ValueKey(0)) {
                          if (momkin) {
                            _card9 = getCard(9);
                            momkin = false;
                          }
                        } else {
                          if (isVibrate) {
                            Vibration.vibrate(
                                pattern: [2000, 600, 1000, 600, 1000, 600],
                                amplitude: 1);
                          } else
                            haa = Alignment.bottomRight;

                          _card9 = getCard(0);
                          momkin = true;
                        }
                      });
                    }),
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
