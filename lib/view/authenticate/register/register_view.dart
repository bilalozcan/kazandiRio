import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/authenticate/login/login_view.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:stacked/stacked.dart';
import 'register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 25),
                    child: Container(
                      height: context.dynamicHeight(1),
                      width: context.dynamicWidth(1),
                      child: Column(
                        children: [
                          CustomText('KazandıRio\'lu',
                              fontWeight: FontWeight.w500, fontSize: 20),
                          SizedBox(height: context.dhExceptStatusBar(0.02)),
                          CustomText(
                              'KazandıRio fırsatlarından yararlanmak için hemen giriş yap.',
                              color: Colors.grey,
                              textAlign: TextAlign.center),
                          SizedBox(height: context.dhExceptStatusBar(0.2)),
                          CustomText('Giriş yapmak için;', color: Colors.grey),
                          SizedBox(height: context.dhExceptStatusBar(0.01)),
                          SocialLoginButton(
                              buttonType: SocialLoginButtonType.facebook,
                              text: 'Facebook hesabını kullan',
                              onPressed: () {}),
                          SizedBox(height: context.dhExceptStatusBar(0.02)),
                          SocialLoginButton(
                              buttonType: SocialLoginButtonType.google,
                              text: 'Google+ hesabını kullan',
                              onPressed: () {}),
                          SizedBox(height: context.dhExceptStatusBar(0.1)),
                          Row(children: <Widget>[
                            Expanded(child: Divider(thickness: 1)),
                            SizedBox(width: context.dynamicWidth(0.02)),
                            CustomText('ya da'),
                            SizedBox(width: context.dynamicWidth(0.02)),
                            Expanded(child: Divider(thickness: 1)),
                          ]),
                          SizedBox(height: context.dhExceptStatusBar(0.06)),
                          SocialLoginButton(
                              buttonType: SocialLoginButtonType.generalLogin,
                              text: 'Telefon numaran ile giriş yap',
                              backgroundColor: Colors.white,
                              textColor: Colors.grey,
                              fontSize: 18,
                              onPressed: () => context.navigateTo(LoginView())),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: context.dhExceptStatusBar(0.02),
                    right: context.dhExceptStatusBar(0.02),
                    child: CircleAvatar(
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => context.pop(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
