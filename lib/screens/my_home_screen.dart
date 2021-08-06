
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../provider/data_provider.dart';
import '../utils/my_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  _MyHomePageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title
        ),
      ),
      body: Center(
        child:Text('counter : '+Provider.of<MyProvider>(context).counter.toString()),
      ),
      drawer: MyDrawer(),
    );
  }
}