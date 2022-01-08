import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/event/evet_view.dart';
import 'package:kazandirio/view/main/main_view.dart';

class SplashViewModel extends CustomBaseViewModel {

  @override
  void initialize(BuildContext context) async {
    this.context = context;
    await Future.delayed(Duration(seconds: 3));
    context.navigateToReplacement(EventView());
    // if (LocaleManager.instance.getBoolValue(Locale.LOGIN.value)) {
    //   var result = await _authService.getProfile();
    //   if(result != null) {
    //     BaseData.instance?.user = result.user;
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => MainView()));
    //   }
    //
    // } else {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => LoginView()));
    // }
  }
}