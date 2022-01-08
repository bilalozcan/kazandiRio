import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/model/gain.dart';
import 'package:kazandirio/widgets/custom_button.dart';
import 'package:kazandirio/widgets/custom_text.dart';

class WinDetailView extends StatelessWidget {
  final Gain gain;

  const WinDetailView({Key? key, required this.gain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background2.png'), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              CustomText('Tebrikler!',
                  fontSize: 22, fontWeight: FontWeight.w500),
              SizedBox(height: context.dhExceptStatusBar(0.02)),
              CustomText(
                '${gain.gift!.benefitName} Kazandın!',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xff2751B8),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.dhExceptStatusBar(0.05)),
              Image.network(gain.gift!.benefitImageUrl!),
              SizedBox(height: context.dhExceptStatusBar(0.02)),
              CustomButton(
                onPressed: () => context.pop(),
                text: 'Hemen Kullan',
                width: context.dynamicWidth(0.4),
                textColor: Colors.white,
                backgroundColor: Color(0xff2751B8),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
