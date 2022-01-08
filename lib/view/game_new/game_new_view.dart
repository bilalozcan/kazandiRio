import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/game_new/game_new_view_model.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';

class GameNewView extends StatelessWidget {
  const GameNewView({Key? key, required this.rivalUserId}) : super(key: key);
  final String rivalUserId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameNewViewModel>.reactive(
        viewModelBuilder: () => GameNewViewModel(),
        onModelReady: (model) => model.init(rivalUserId, 'spor'),
        builder: (context, viewModel, child) {
          return Scaffold(
              backgroundColor: Color(0xffEEEEEE),
              appBar: AppBar(
                title: CustomText('KazandıRio Etkinlik : Spor',
                    fontWeight: FontWeight.w500, fontSize: 18),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                leading: SizedBox(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: Color(0xff2751B8),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  )
                ],
              ),
              body: viewModel.initialised
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircularCountDownTimer(
                              duration: 10,
                              initialDuration: 0,
                              controller: CountDownController(),//viewModel.countDownController,
                              width: context.dhExceptStatusBarAppBar(0.1),
                              height: context.dhExceptStatusBarAppBar(0.1),
                              ringColor: Colors.grey.shade200,
                              ringGradient: null,
                              fillColor: Color(0xff2751B8).withAlpha(120),
                              fillGradient: null,
                              backgroundColor: Color(0xff2751B8),
                              backgroundGradient: null,
                              strokeWidth: 20.0,
                              strokeCap: StrokeCap.round,
                              textStyle: TextStyle(
                                  fontSize: 33.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textFormat: CountdownTextFormat.S,
                              isReverse: true,
                              isReverseAnimation: false,
                              isTimerTextShown: true,
                              autoStart: true,
                              onStart: () {
                                // viewModel.countDownController.start();
                              },
                              onComplete: () {
                                print('Countdown Ended');
                              },
                            ),
                            Container(
                              width: context.dynamicWidth(0.85),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff2751B8).withOpacity(0.5),
                                      offset: Offset(5, 5))
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    CustomText(
                                      viewModel.question['title'],
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      textAlign: TextAlign.center,
                                    ),
                                    ...(viewModel.question['stylish'] as List)
                                        .map((e) {
                                      var index = (viewModel.question['stylish']
                                              as List)
                                          .indexOf(e);
                                      return InkWell(
                                        onTap: () {
                                          print('a');
                                          if (!viewModel.isSelected) {
                                            viewModel.selectedIndex = index;
                                            viewModel.isSelected = true;
                                          }
                                        },
                                        splashColor: HexColor('FFCC3D'),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    viewModel.selectedIndex ==
                                                            index
                                                        ? Colors.grey
                                                        : HexColor('2751B8'),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: CustomText(
                                                      e,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ],
                                ),
                              ),
                            ),
                            Image.asset('assets/icon.png', scale: 2.9,)
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ));
        });
  }
}
