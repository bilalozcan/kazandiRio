import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:kazandirio/view/game_new/game_new_view.dart';
import 'package:stacked/stacked.dart';

class GameViewModel extends BaseViewModel {
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
  BaseData baseData = BaseData.instance!;
  var _rivalUser;

  get rivalUser => _rivalUser;

  set rivalUser(value) {
    _rivalUser = value;
    notifyListeners();
  }

  String? _roomId;

  String? get roomId => _roomId;

  set roomId(String? value) {
    _roomId = value;
    notifyListeners();
  }

  init(String docId, BuildContext context) {
    setInitialised(true);
    var res = firestoreService.getGameRooms().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          var data = element.data();
          bool control = false;
          if (data['users'].length < 2) {
            control = true;
            roomId = data['id'];
            firestoreService.firestore.collection('gameRoom').doc(data['id']).update({
              'users': FieldValue.arrayUnion([baseData.user!.id!]),
            });
          }
          if (!control) {
            var id = generateRandomString(20);
            firestoreService.firestore.collection('gameRoom').doc(id).set({
              'id': id,
              'status': 'search',
              'users': FieldValue.arrayUnion([baseData.user!.id!]),
            });
            roomId = id;
          }
        });
      } else {
        var id = generateRandomString(20);
        firestoreService.firestore.collection('gameRoom').doc(id).set({
          'id': id,
          'status': 'search',
          'users': FieldValue.arrayUnion([baseData.user!.id!]),
        });
        roomId = id;
      }
    });
    // StreamController streamController= StreamController();
    // var streamRoom =  streamRoomControl();
    // streamRoom.pipe(streamController);
    // streamRoom.forEach((element) {
    //   if (element.docs.isEmpty) {
    //     var id = generateRandomString(20);
    //     firestoreService.firestore.collection('gameRoom').doc(id).set({
    //       'id': id,
    //       'status': 'search',
    //       'users': FieldValue.arrayUnion([baseData.user!.id!]),
    //     });
    //     streamController.close();
    //   } else
    //     element.docs.forEach((element) {
    //       var data = element.data();
    //       bool control = false;
    //       if (data['users'].length < 2) {
    //         control = true;
    //         firestoreService.firestore.collection('gameRoom').doc(data['id']).update({
    //           'users': FieldValue.arrayUnion([baseData.user!.id!]),
    //         });
    //         streamController.close();
    //       }
    //       if (!control) {
    //         var id = generateRandomString(20);
    //         firestoreService.firestore.collection('gameRoom').doc(id).set({
    //           'id': id,
    //           'status': 'search',
    //           'users': FieldValue.arrayUnion([baseData.user!.id!]),
    //         });
    //         streamController.close();
    //       }
    //     });
    // });

    // while(rivalUser==null){
    //   var data =  await firestoreService.getLivesUserStreamCode(docId,baseData.user!.id!).then((value) {
    //     if(value.docs.isNotEmpty){
    //       rivalUser = value.docs.first.data();
    //     }
    //   });
    // }
    // setInitialised(true);
    // notifyListeners();
    // if(rivalUser!=null){
    //   Future.delayed(Duration(seconds: 3)).then((value) async{
    //     var id = generateRandomString(20);
    //    await firestoreService.firestore.collection('gameRoom').doc(id).set({
    //       'user2':rivalUser['senderId'],
    //       'user1':baseData.user!.id,
    //       'status':'GAME',
    //     });
    //    context.navigateToReplacement(GameNewView(gameRoomId:id ));
    //   });
    // }
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }
}
