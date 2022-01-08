import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/widgets/custom_button.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';

import 'wallet_view_model.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletViewModel>.reactive(
        viewModelBuilder: () => WalletViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0xffEEEEEE),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1.5,
              toolbarHeight: 70,
              centerTitle: true,
              title: CustomText('Cüzdanım'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/gift-box.png', scale: 3)),
                  SizedBox(height: context.dhExceptStatusBarAppBar(0.05)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomText(
                      'Kampanyalara tek tıkla katıl ve KazandıRio ile kazanmaya başla.',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: context.dhExceptStatusBarAppBar(0.05)),
                  CustomButton(
                    onPressed: () {},
                    text: 'Haydi, Giriş yap & Üye Ol',
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          );
        });
  }
}
