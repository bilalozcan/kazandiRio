import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:kazandirio/model/user.dart';
import 'package:kazandirio/view/game/game_view.dart';
import 'package:stacked/stacked.dart';
class Code{
  String? code;
  String? id;
  bool? status;
  int? point;
  Code({
    this.code,
    this.id,
    this.status,
    this.point
});
}
class LiveViewModel extends BaseViewModel{
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
  BaseData baseData = BaseData.instance!;
  ScrollController scrollController = ScrollController();
  late User user;
   String eventId='';


   var textListSearch=[
     'Kod başarılı Rakip bulmak için seni yönlendiriyoruz!!',
     'Kod aktifleştirildi artık yarışabilirsiniz!!',
     'Kod doğrulandı'
   ];

  init( String eventID){
    setInitialised(false);
    user = baseData.user!;
    eventId = eventID;
    setInitialised(true);
  }

  userEventAddFunc()async {
    await firestoreService.addEventUser(eventId, user.id!);
  }
  userEventDeleteFunc()async {
    await firestoreService.deleteEventUser(eventId, user.id!);
  }
  getUserCode()async{
   return  await firestoreService.getUserCode(user.id!).then((value) {
     var codeList=<Code>[];
     if(value.docs.isNotEmpty){
       for(var i in value.docs){
         codeList.add(Code(
           code: i.data()['code'],
           id: i.data()['id'],
           status: i.data()['status'],
           point: i.data()['point']
         ));
       }
     }
     return codeList;
   });
  }

  addMeesage(var map,String codeId,BuildContext context)async {
    await firestoreService.addMessage(map, eventId,codeId,user.id!);
    var list = ['spor','teknoloji','genel kültür'];
    var rng = new Random();
    try{
      await Future.delayed(Duration(seconds: 2)).then((value)async{
        await context.navigateTo(GameView(evetId: eventId,));
      });
      notifyListeners();
    }
    catch(e){
      await context.navigateTo(GameView(evetId: eventId,));
    }

  }
}