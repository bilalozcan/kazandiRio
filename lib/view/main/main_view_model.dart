import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_view_model.dart';

class MainViewModel extends CustomBaseViewModel {
  int _bottomBarIndex = 0;

  int get bottomBarIndex => _bottomBarIndex;

  set bottomBarIndex(int value) {
    _bottomBarIndex = value;
    notifyListeners();
  }

  @override
  void initialize(BuildContext context) async {
    this.context = context;
  }
}
