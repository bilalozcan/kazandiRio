import 'package:flutter/material.dart';
import 'package:kazandirio/view/game/game_view_model.dart';
import 'package:stacked/stacked.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameViewModel>.reactive(
        viewModelBuilder: () => GameViewModel(),
        builder: (context, viewModel, child) {
          return Container();
        });
  }
}
