import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/service/auth_service.dart';
import 'package:kazandirio/view/authenticate/verification/verification_view.dart';
import 'package:kazandirio/core/extension/context_extension.dart';

class LoginViewModel extends CustomBaseViewModel {
  final phoneController = TextEditingController();

  void initialize(BuildContext context) {
    this.context = context;
  }

  void login() async {
    isLoading = true;
    if (phoneController.text.isNotEmpty) {
      var result = await AuthService.instance!.login(phoneController.text);
      if (result != null && result.isValid!) {
        context.navigateToReplacement(
            VerificationView(phoneNumber: phoneController.text));
      } else {
        Fluttertoast.showToast(msg: 'Giriş Hatalı');
      }
    } else {
      Fluttertoast.showToast(msg: 'Lütfen telefon numarası giriniz');
    }

    isLoading = false;
  }
}
