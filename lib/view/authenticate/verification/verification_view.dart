import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/widgets/custom_button.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:kazandirio/widgets/custom_text_form_field.dart';
import 'package:stacked/stacked.dart';

import 'verification_view_model.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerificationViewModel>.reactive(
        viewModelBuilder: () => VerificationViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: CustomText('Doğrulama Kodu',
                  color: Colors.black87, fontWeight: FontWeight.w500),
              centerTitle: true,
              elevation: 0,
              leadingWidth: context.dynamicWidth(0.09),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundColor: Color(0xff2751B8),
                  radius: 5,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    iconSize: 16,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: Container(
                height: context.dynamicHeight(1),
                width: context.dynamicWidth(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                            'Numaranıza gelen doğrulama kodunu aşağıdaki alana giriniz.',
                            color: Colors.grey,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    CustomTextFormField(
                      TextEditingController(),
                      hintText: 'Doğrulama Kodu',
                      textInputType: TextInputType.phone,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'Numarayı Doğrula',
                      height: context.dhExceptStatusBar(0.08),
                      textColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
