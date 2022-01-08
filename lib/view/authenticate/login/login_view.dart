import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/authenticate/verification/verification_view.dart';
import 'package:kazandirio/widgets/custom_button.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:kazandirio/widgets/custom_text_form_field.dart';
import 'package:kazandirio/widgets/loading_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:stacked/stacked.dart';

import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 35),
                    child: Container(
                      height: context.dynamicHeight(1),
                      width: context.dynamicWidth(1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomText('Giriş Yap',
                                  fontWeight: FontWeight.w500, fontSize: 20),
                              SizedBox(height: context.dhExceptStatusBar(0.02)),
                              CustomText(
                                  'KazandıRio fırsatlarından yararlanmak için giriş yap.',
                                  color: Colors.grey,
                                  textAlign: TextAlign.center),
                            ],
                          ),
                          CustomTextFormField(
                            viewModel.phoneController,
                            hintText: '(5 _ _ )  _ _ _   _ _   _ _',
                            textInputType: TextInputType.phone,
                          ),
                          CustomButton(
                            onPressed: () => viewModel.login(),
                            text: 'Giriş yap',
                            height: context.dhExceptStatusBar(0.08),
                            textColor: Colors.white,
                          )
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
                  LoadingWidget(viewModel.isLoading)
                ],
              ),
            ),
          );
        });
  }
}
