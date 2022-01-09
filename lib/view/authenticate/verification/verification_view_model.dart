import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/core/constant/enum/locale_enum.dart';
import 'package:kazandirio/core/init/cache/locale_manager.dart';
import 'package:kazandirio/core/init/network/network_manager.dart';
import 'package:kazandirio/service/auth_service.dart';
import 'package:kazandirio/core/extension/locale_extension.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/main/main_view.dart';

class VerificationViewModel extends CustomBaseViewModel {
  final validationCode = TextEditingController();

  void initialize(BuildContext context) {
    this.context = context;
  }

  void verification(String phoneNumber) async {
    isLoading = true;
    if (validationCode.text.isNotEmpty) {
      var result = await AuthService.instance!
          .validate(phoneNumber, validationCode.text);
      if (result != null) {
        LocaleManager.instance.setBoolValue(Locale.LOGIN.value, true);
        LocaleManager.instance
            .setStringValue(Locale.TOKEN.value, result.token!);
        NetworkManager.instance!.updateToken(result.token!);
        var profile = await AuthService.instance!.getProfile();
        if (profile != null) {
          BaseData.instance!.user = profile;
          context.navigateToRemoveUntil(MainView());
        }
      }
    }else {
      Fluttertoast.showToast(msg: 'Lütfen kodu giriniz');
    }
    isLoading = false;
  }
}
