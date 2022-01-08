import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/service/code_service.dart';
import 'package:kazandirio/view/win/win_detail_view.dart';

class ReadWinViewModel extends CustomBaseViewModel {
  final code = TextEditingController();

  void initialize(BuildContext context) {
    this.context = context;
  }

  void codeRedeem() async {
    isLoading = true;
    if (code.text.isNotEmpty) {
      var result = await CodeService.instance!.codeRedeem(code.text);
      if (result != null) {
        print('Code okutma başarılı');
        code.clear();
        context.navigateTo(WinDetailView(gain: result));
      }
    } else {
      Fluttertoast.showToast(msg: 'Lütfen şifre giriniz');
    }
    isLoading = false;
  }
}
