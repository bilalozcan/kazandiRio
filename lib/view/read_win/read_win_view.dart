import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/widgets/custom_button.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:kazandirio/widgets/custom_text_form_field.dart';
import 'package:kazandirio/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import 'read_win_view_model.dart';

class ReadWinView extends StatelessWidget {
  const ReadWinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReadWinViewModel>.reactive(
        viewModelBuilder: () => ReadWinViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0xffEEEEEE),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1.5,
              toolbarHeight: 70,
              centerTitle: true,
              title: CustomText('Okut Kazan'),
            ),
            body: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                  child: Container(
                    width: context.dynamicWidth(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            'Açma halkası, cips paketi veya kapaklardaki şifreyi ekranda belirtilen alana girerek ödülleri kazanın.',
                            color: Colors.grey,
                            textAlign: TextAlign.center),
                        CustomTextFormField(
                          viewModel.code,
                          hintText: 'Şifre',
                        ),
                        CustomButton(
                          onPressed: () => viewModel.codeRedeem(),
                          text: 'Kazan',
                          height: context.dhExceptStatusBar(0.08),
                          textColor: Colors.white,
                          backgroundColor: Color(0xff2751B8),
                        )
                      ],
                    ),
                  ),
                ),
                LoadingWidget(viewModel.isLoading)
              ],
            ),
          );
        });
  }
}
