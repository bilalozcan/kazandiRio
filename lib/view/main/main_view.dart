import 'package:flutter/material.dart';
import 'package:kazandirio/view/campaigns/campaigns_view.dart';
import 'package:kazandirio/view/event/event_view.dart';
import 'package:kazandirio/view/read_win/read_win_view.dart';
import 'package:kazandirio/view/wallet/wallet_view.dart';
import 'package:stacked/stacked.dart';

import 'main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: body(viewModel.bottomBarIndex),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.bottomBarIndex,
              selectedItemColor: Color(0xff2751B8),
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              onTap: (value) => viewModel.bottomBarIndex = value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.event),
                    activeIcon: Icon(Icons.event_available),
                    label: 'Etkinlikler'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home_filled),
                    label: 'Kampanyalar'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_scanner), label: 'Okut Kazan'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.account_balance_wallet),
                    icon: Icon(Icons.account_balance_wallet_outlined),
                    label: 'Cüzdanım'),
              ],
            ),
          );
        });
  }

  Widget body(int index) {
    switch(index) {
      case 0:
        return EventView();
      case 1:
        return CampaignsView();
      case 2:
        return ReadWinView();
      case 3:
        return WalletView();
      default:
        return SizedBox();
    }

  }
}
