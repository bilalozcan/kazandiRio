import 'package:flutter/material.dart';
import 'package:kazandirio/view/campaigns/campaigns_view.dart';
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
              onTap: (value) => viewModel.bottomBarIndex = value,
              items: [
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
        return CampaignsView();
      case 1:
        return Center(child: Text('QR'));
      case 2:
        return Center(child: Text('Cüzdanım'));
      default:
        return SizedBox();
    }

  }
}
