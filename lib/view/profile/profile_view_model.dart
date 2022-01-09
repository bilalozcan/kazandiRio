import 'package:flutter/cupertino.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/core/constant/enum/locale_enum.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/core/extension/locale_extension.dart';
import 'package:kazandirio/core/init/cache/locale_manager.dart';
import 'package:kazandirio/view/main/main_view.dart';

class ProfileViewModel extends CustomBaseViewModel {
  void initialize(BuildContext context) {
    this.context = context;
  }

  void logout() async {
    LocaleManager.instance.setBoolValue(Locale.LOGIN.value, false);
    LocaleManager.instance.removeKey(Locale.TOKEN.value);
    BaseData.instance!.user = null;
    context.navigateToRemoveUntil(MainView());
  }
}
