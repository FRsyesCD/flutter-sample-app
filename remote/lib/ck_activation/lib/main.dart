import 'package:flutter/material.dart';
import 'dart:math' as maths;

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CK Activation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CK Activation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller;
  TextEditingController _controller2;
  String value = "0";
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  value,
                  style: TextStyle(color: Colors.green),
                )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'code pc'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: TextField(
                    controller: _controller2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'agreement'),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        'Activate',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.amber,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      value = identityHashCode("11|11").toString();
                      Clipboard.setData(ClipboardData(text: value));
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
