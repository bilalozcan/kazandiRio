import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
              backgroundColor: Color(0xff0C2D83),
              body: Center(child: Image.asset('assets/icon.png')));
        });
  }
}
