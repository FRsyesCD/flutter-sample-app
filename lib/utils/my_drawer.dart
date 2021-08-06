

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../provider/data_provider.dart';
import '../screens/my_home_screen.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child:  Column(
            children: <Widget>[
              
              DrawerHeader(
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(padding: EdgeInsets.only(bottom: 20),child: Text('Love State',style: TextStyle(fontSize: 25),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: 
                        Provider.of<MyProvider>(context).loveState
                    ),
                  ],
                ),
                ),
                
                ListTile(
                title: Text('Test'),
                leading: Icon(
                Icons.featured_play_list,
                color: Colors.red,
                ),
                onTap: (){
                 Navigator.of(context).pushNamed('/test_screen');
                },
                ),
                Divider(
                  endIndent: 30,
                  indent: 30,
                ),
                ListTile(
                title: Text('generate code'),
                leading: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        ),
                onTap:  (){
                  Navigator.of(context).pushNamed('/gen_screen');
                }
                ),
            ],
        ),
      
    );
  }
}