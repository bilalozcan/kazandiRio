import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/view/game/delayed_animation.dart';
import 'package:kazandirio/view/game/game_view_model.dart';
import 'package:kazandirio/view/game_new/game_new_view.dart';
import 'package:stacked/stacked.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key,required this.evetId,required this.codePoint,required this.category}) : super(key: key);
  final String evetId;
  final int codePoint;
  final String category;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameViewModel>.reactive(
        viewModelBuilder: () => GameViewModel(),
        onModelReady: (model)=>model.init(evetId,context,codePoint),
        builder: (context, viewModel, child) {
          // viewModel.init(evetId,context);
          return WillPopScope(
            onWillPop: ()async{
              viewModel.firestoreService.firestore.collection('gameRoom').doc(viewModel.roomId).delete();
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Stack(
                  children: [
                    Column(
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
                       if(viewModel.roomId!=null) DelayedAnimation(
                          curve: Curves.decelerate,
                          delayedAnimation: 1100,
                          child: StreamBuilder(
                            stream: viewModel.firestoreService.getGameRoomStream(viewModel.roomId!),
                            builder: (context,dynamic sn){
                              var data={};
                              var user1 ='';
                              var user2 = '';
                              if(sn.hasData){
                                data = sn.data.data();
                                user1 = data['users'].elementAt(0)['name']??'';
                                if(data['users'].length>1)
                                user2 = data['users'].elementAt(1)['name']??'';
                                if(user1!=''&&user2!=''&&viewModel.roomId!=null&&data['status']=='search'){
                                    Future.delayed(Duration(seconds: 3)).then((value) async{
                                      viewModel.firestoreService.firestore.collection('gameRoom').doc(viewModel.roomId!).update({
                                        'status':'GAME'
                                      });
                                      context.navigateToReplacement(GameNewView(gameRoomId:viewModel.roomId!,category: category, ));
                                    });

                                }
                              }
                              return sn.hasData?Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      width: context.dynamicWidth(0.425),
                                      child: Text(user1,
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
                                      child: Text(user2,
                                          style: Theme.of(context).textTheme.headline6?.copyWith(color: Color(0xff4d81d7)))):
                                  Container(
                                      alignment: Alignment.center,
                                      width: context.dynamicWidth(0.425),
                                      child: Text('',
                                          style: Theme.of(context).textTheme.headline6?.copyWith(color: Color(0xff4d81d7))))
                                ],
                              ):Container();
                            },
                          )
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
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          viewModel.firestoreService.firestore.collection('gameRoom').doc(viewModel.roomId).delete();
                          context.pop();
                          },
                        child: Container(
                          height: 35,
                          width: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: HexColor('#CE442C'), shape: BoxShape.circle),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 28,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}