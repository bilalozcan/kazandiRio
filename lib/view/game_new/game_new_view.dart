import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/game_new/game_new_view_model.dart';
import 'package:kazandirio/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';

class GameNewView extends StatelessWidget {
  const GameNewView({Key? key, required this.gameRoomId,required this.category}) : super(key: key);
  final String gameRoomId;
  final String category;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameNewViewModel>.reactive(
        viewModelBuilder: () => GameNewViewModel(),
        onModelReady: (model) => model.init(category),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0xffEEEEEE),
            appBar: AppBar(
              title: CustomText('KazandıRio Etkinlik : Spor', fontWeight: FontWeight.w500, fontSize: 18),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: SizedBox(),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xff2751B8),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            body: viewModel.initialised
                ? StreamBuilder(
                    stream: viewModel.firestoreService.getGameRoom(gameRoomId),
                    builder: (context, dynamic sn) {
                      var data;
                      if (sn.hasData) {
                        data = sn.data.data();
                      }
                      if(data!=null){
                        return data['status'] == 'GAME'
                            ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularCountDownTimer(
                                  duration: 60,
                                  initialDuration: 0,
                                  controller: viewModel.countDownController,
                                  //viewModel.countDownController,
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
                                  textStyle: TextStyle(fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
                                  textFormat: CountdownTextFormat.S,
                                  isReverse: true,
                                  isReverseAnimation: false,
                                  isTimerTextShown: true,
                                  autoStart: true,
                                  onStart: () {
                                    // viewModel.countDownController.start();
                                  },
                                  onComplete: () {
                                    if (data['status'] == 'GAME') {
                                      viewModel.firestoreService.firestore.collection('gameRoom').doc(gameRoomId).update({'status': 'TIMEOFF'});
                                    }
                                  },
                                ),
                                Container(
                                  width: context.dynamicWidth(0.85),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(color: Color(0xff2751B8).withOpacity(0.5), offset: Offset(5, 5))],
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
                                        ...(viewModel.question['stylish'] as List).map((e) {
                                          var index = (viewModel.question['stylish'] as List).indexOf(e);
                                          return InkWell(
                                            onTap: () async {
                                              print('a');
                                              if (!viewModel.isSelected) {
                                                viewModel.selectedIndex = index;
                                                viewModel.isSelected = true;
                                                if (viewModel.selectedIndex == viewModel.question['correctAnswer']) {
                                                  viewModel.firestoreService.firestore.collection('gameRoom').doc(gameRoomId).update({
                                                    'winner': {'id': viewModel.baseData.user!.id, 'name': viewModel.baseData.user!.fullName},
                                                    'status': 'WINNER'
                                                  });
                                                  var a = await viewModel.firestoreService.firestore
                                                      .collection('leaderBoard')
                                                      .doc(viewModel.baseData.user!.id!)
                                                      .get();
                                                  if (a.exists) {
                                                    await viewModel.firestoreService.firestore
                                                        .collection('leaderBoard')
                                                        .doc(viewModel.baseData.user!.id!)
                                                        .update({
                                                      'id': viewModel.baseData.user!.id!,
                                                      'name': viewModel.baseData.user!.fullName,
                                                      'point': FieldValue.increment(data['point'] ?? 5),
                                                    });
                                                  } else {
                                                    await viewModel.firestoreService.firestore
                                                        .collection('leaderBoard')
                                                        .doc(viewModel.baseData.user!.id!)
                                                        .set({
                                                      'id': viewModel.baseData.user!.id!,
                                                      'name': viewModel.baseData.user!.fullName,
                                                      'point': data['point'] ?? 5,
                                                    });
                                                  }
                                                }
                                              }
                                            },
                                            splashColor: HexColor('FFCC3D'),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: viewModel.selectedIndex == index ? Colors.grey : HexColor('2751B8'),
                                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
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
                                Image.asset(
                                  'assets/icon.png',
                                  scale: 2.9,
                                )
                              ],
                            ),
                          ),
                        )
                            : data['status'] == 'TIMEOFF'
                            ? Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: context.dynamicWidth(0.85),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(color: Color(0xff2751B8).withOpacity(0.5), offset: Offset(5, 5))],
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
                                            ...(viewModel.question['stylish'] as List).map((e) {
                                              var index = (viewModel.question['stylish'] as List).indexOf(e);
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
                                                        color: viewModel.selectedIndex == index ? Colors.grey : HexColor('2751B8'),
                                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
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
                                    Image.asset(
                                      'assets/icon.png',
                                      scale: 2.9,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              top: 0,
                              child: Container(
                                color: Colors.grey.withOpacity(0.3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.lock_clock,
                                      size: 50,
                                    ),
                                    Text(
                                      'SÜRE BİTTİ',
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                            : data['status'] == 'WINNER'
                            ? Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: context.dynamicWidth(0.85),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(color: Color(0xff2751B8).withOpacity(0.5), offset: Offset(5, 5))],
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
                                            ...(viewModel.question['stylish'] as List).map((e) {
                                              var index = (viewModel.question['stylish'] as List).indexOf(e);
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
                                                        color: viewModel.selectedIndex == index ? Colors.grey : HexColor('2751B8'),
                                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
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
                                    Image.asset(
                                      'assets/icon.png',
                                      scale: 2.9,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              top: 0,
                              child: Container(
                                color: data['winner']['id'] == viewModel.baseData.user!.id!
                                    ? Colors.green.withOpacity(0.3)
                                    : Colors.red.withOpacity(0.3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.lock_clock,
                                      size: 50,
                                    ),
                                    Text(
                                      data['winner']['id'] == viewModel.baseData.user!.id! ? ' KAZANDINIZ' : 'KAYBETTİNİZ',
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                            : Container();
                      }
                      else {
                        return Container();
                      }
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }
}
