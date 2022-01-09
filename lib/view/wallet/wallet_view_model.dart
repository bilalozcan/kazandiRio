import 'package:flutter/cupertino.dart';
import 'package:kazandirio/core/base/base_view_model.dart';

class WalletViewModel extends CustomBaseViewModel {
  var list = [];
  void initialize(BuildContext context) {
    this.context = context;
  }
}
