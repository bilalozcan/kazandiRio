import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/core/constant/enum/locale_enum.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/core/init/cache/locale_manager.dart';
import 'package:kazandirio/service/auth_service.dart';
import 'package:kazandirio/view/event/event_view.dart';
import 'package:kazandirio/view/leader_board/leader_board_view.dart';
import 'package:kazandirio/view/main/main_view.dart';
import 'package:kazandirio/core/extension/locale_extension.dart';
import 'package:kazandirio/view/game_new/game_new_view.dart';

class SplashViewModel extends CustomBaseViewModel {
  @override
  void initialize(BuildContext context) async {
    this.context = context;
    await Future.delayed(Duration(seconds: 1));
    if (LocaleManager.instance.getBoolValue(Locale.LOGIN.value)) {
      var result = await AuthService.instance!.getProfile();
      if (result != null) {
        BaseData.instance?.user = result;
        print(result.toJson());
      }
    }
     context.navigateToReplacement(MainView());
    // context.navigateToReplacement(GameNewView(gameRoomId: ''));
    // context.navigateToReplacement(LeaderBoardView());
  }
}
