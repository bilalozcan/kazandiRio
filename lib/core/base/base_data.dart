

import 'package:kazandirio/model/user.dart';

class BaseData {
  static BaseData? _instance;

  static BaseData? get instance {
    _instance ??= BaseData._init();
    return _instance;
  }

  BaseData._init();

  User? user;


}