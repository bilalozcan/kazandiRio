import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_view_model.dart';

class SplashViewModel extends CustomBaseViewModel {

  @override
  void initialize(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
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