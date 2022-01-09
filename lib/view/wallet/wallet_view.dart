import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/authenticate/register/register_view.dart';
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
              child: BaseData.instance!.user == null
                  ? buildColumn(context, false)
                  : viewModel.list.isNotEmpty
                      ? ListView()
                      : buildColumn(context, true),
            ),
          );
        });
  }

  Column buildColumn(BuildContext context, bool isSigned) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/gift-box.png', scale: 3)),
        SizedBox(height: context.dhExceptStatusBarAppBar(0.05)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomText(
            isSigned ? 'Cüzdanında henüz hiç hediyen yok. Şifreni okut, kazanmaya başla!' : 'Kampanyalara tek tıkla katıl ve KazandıRio ile kazanmaya başla.',
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: context.dhExceptStatusBarAppBar(0.05)),
        if (!isSigned)
          CustomButton(
            onPressed: () => context.navigateTo(RegisterView()),
            text: 'Haydi, Giriş yap & Üye Ol',
            textColor: Colors.white,
            backgroundColor: Color(0xff2751B8),
          )
      ],
    );
  }
}
