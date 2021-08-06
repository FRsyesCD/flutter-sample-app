import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mydataprovider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double rightvalue = 0;
  double sizevalue = 0;
  double leftvalue = 0;
  @override
  Widget build(BuildContext context) {
    rightvalue = Provider.of<MyDataProvider>(context).getright();
    leftvalue = Provider.of<MyDataProvider>(context).getleft();
    sizevalue = Provider.of<MyDataProvider>(context).getsize();
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/images/how to.png',
        ),
        Card(
          elevation: 3,
          child: Column(
            children: <Widget>[
              Text('Right'),
              RotatedBox(
                quarterTurns: -10,
                child: Slider(
                  value: rightvalue,
                  max: 300,
                  min: 0,
                  label: rightvalue.toString(),
                  onChanged: (d) {
                    setState(() {
                      rightvalue = d;
                      Provider.of<MyDataProvider>(context).setright(d);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 3,
          child: Column(
            children: <Widget>[
              Text('Left'),
              Slider(
                value: leftvalue,
                max: 300,
                min: 0,
                label: leftvalue.toString(),
                onChanged: (d) {
                  setState(() {
                    leftvalue = d;
                    Provider.of<MyDataProvider>(context).setleft(d);
                  });
                },
              ),
            ],
          ),
        ),
        Card(
          elevation: 3,
          child: Column(
            children: <Widget>[
              Text('Size'),
              Slider(
                value: sizevalue,
                max: 10,
                min: 0,
                label: sizevalue.toString(),
                onChanged: (d) {
                  setState(() {
                    sizevalue = d;
                    Provider.of<MyDataProvider>(context).setsize(d);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
