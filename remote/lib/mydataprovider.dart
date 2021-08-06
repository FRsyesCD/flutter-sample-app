import 'package:flutter/material.dart';

class MyDataProvider extends ChangeNotifier {
  double left = 2;
  double right = 2;
  double size = 3;
  bool visible = false;

  void setleft(double l) {
    left = l;
    notifyListeners();
  }

  double getleft() {
    return left;
  }

  void setvisible(bool l) {
    visible = l;
    notifyListeners();
  }

  bool getvisile() {
    return visible;
  }

  void setright(double r) {
    right = r;
    notifyListeners();
  }

  double getright() {
    return right;
  }

  void setsize(double s) {
    size = s;
    notifyListeners();
  }

  double getsize() {
    return size;
  }
}
