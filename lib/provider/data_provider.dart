import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier
{
  int counter=10;
  final double _iconsize=40.0;
  int _lovestate=0;
  List<Widget> loveState;
  
   MyProvider(){
  loveState=[
  Icon(Icons.favorite_border,color:Colors.red,size:_iconsize),
  Icon(Icons.favorite_border,color:Colors.red,size:_iconsize),
  Icon(Icons.favorite_border,color:Colors.red,size:_iconsize),
  Icon(Icons.favorite_border,color:Colors.red,size:_iconsize),
  Icon(Icons.favorite_border,color:Colors.red,size:_iconsize)
  ];
  }
  void loveincreament(){
    loveState[_lovestate]=Icon(Icons.favorite,color:Colors.red,size: _iconsize);
    if(_lovestate<4){
        _lovestate++;
    }
    notifyListeners();
  }
  void increament(){
    counter++;
    notifyListeners();
  }

}