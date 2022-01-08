import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:kazandirio/service/code_service.dart';
import 'package:kazandirio/view/win/win_detail_view.dart';

class ReadWinViewModel extends CustomBaseViewModel {
  final code = TextEditingController();
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
  BaseData baseData = BaseData.instance!;

  void initialize(BuildContext context) {
    this.context = context;
  }

  void codeRedeem() async {
    isLoading = true;
    if (code.text.isNotEmpty) {
      var result = await CodeService.instance!.codeRedeem(code.text);
      if (result != null) {
        var rng = new Random();
        print('Code okutma başarılı');
        Map<String,dynamic> map = {
          'code':result.code,
          'id':result.id,
          'status':true,
          'point':rng.nextInt(9)+1,
        };
        firestoreService.addCodeUser(map,baseData.user!.id!);
        code.clear();
        context.navigateTo(WinDetailView(gain: result));
      }
    } else {
      Fluttertoast.showToast(msg: 'Lütfen şifre giriniz');
    }
    isLoading = true;
  }
}
