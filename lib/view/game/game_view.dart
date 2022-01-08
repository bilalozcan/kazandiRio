import 'package:flutter/material.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/game/delayed_animation.dart';
import 'package:kazandirio/view/game/game_view_model.dart';
import 'package:stacked/stacked.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key,required this.evetId}) : super(key: key);

  final String evetId;

  @override
  Widget build(BuildContext context) {
    String name1 = 'Bilal';
    String name2 = 'Mehmet';
    return ViewModelBuilder<GameViewModel>.reactive(
        viewModelBuilder: () => GameViewModel(),
        onModelReady: (model)=>model.init(evetId,context),
        builder: (context, viewModel, child) {
          // viewModel.init(evetId,context);
          return SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    DelayedAnimation(
                        curve: Curves.decelerate,
                        delayedAnimation: 300,
                        child: Text('Bilgi Yarışması', style: Theme.of(context).textTheme.headline6)),
                    // DelayedAnimation(
                    //     curve: Curves.decelerate,
                    //     delayedAnimation: 700,
                    //     child: Text('Konu: $category',
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .headline5
                    //             ?.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)))
                  ]),
                  DelayedAnimation(
                    curve: Curves.decelerate,
                    delayedAnimation: 1100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: context.dynamicWidth(0.425),
                            child: Text(name1,
                                style: Theme.of(context).textTheme.headline6?.copyWith(color: Color(0xff50b4a8)))),
                        SizedBox(
                            width: context.dynamicWidth(0.15),
                            child: Text('VS',
                                style: Theme.of(context).textTheme.headline3?.copyWith(
                                    color: Color(0xff572540),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic))),
                        viewModel.initialised?Container(
                            alignment: Alignment.center,
                            width: context.dynamicWidth(0.425),
                            child: Text('dsfsd',
                                style: Theme.of(context).textTheme.headline6?.copyWith(color: Color(0xff4d81d7)))):
                        Container(
                            alignment: Alignment.center,
                            width: context.dynamicWidth(0.425),
                            child: Text('',
                                style: Theme.of(context).textTheme.headline6?.copyWith(color: Color(0xff4d81d7))))
                      ],
                    ),
                  ),
                  DelayedAnimation(
                    curve: Curves.decelerate,
                    delayedAnimation: 1000,
                    child: Row(children: [
                      Image.asset('assets/cbs1.png', width: context.dynamicWidth(0.5)),
                      Image.asset('assets/cbs2.png', width: context.dynamicWidth(0.5)),
                    ]),
                  )
                ],
              ),
            ),
          );
        });
  }
}