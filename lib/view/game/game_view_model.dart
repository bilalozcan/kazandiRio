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


  String? _roomId;

  String? get roomId => _roomId;

  set roomId(String? value) {
    _roomId = value;
    notifyListeners();
  }

  bool _twoUserControl=false;

  bool get twoUserControl => _twoUserControl;

  set twoUserControl(bool value) {
    _twoUserControl = value;
    notifyListeners();
  }

  init(String docId, BuildContext context,int codePoint) async {
    setInitialised(false);
    var res = await firestoreService.getGameRooms( docId).then((value) {
      if (value.docs.isNotEmpty) {
        bool control = false;
        for (var data1 in value.docs) {
          var data = data1.data();
          if (data['users'].length < 2) {
            control = true;
            roomId = data['id'];
            firestoreService.firestore.collection('gameRoom').doc(data['id']).update({
              'users': FieldValue.arrayUnion([
                {'id': baseData.user!.id!, 'name': baseData.user!.fullName}
              ]),
              'point':FieldValue.increment(codePoint),
            });
            break;
          }
        }
        if (!control) {
          var id = generateRandomString(20);
          firestoreService.firestore.collection('gameRoom').doc(id).set({
            'id': id,
            'status': 'search',
            'point':codePoint,
            'users': FieldValue.arrayUnion([
              {'id': baseData.user!.id!, 'name': baseData.user!.fullName}
            ]),
            'eventId':docId,
          });
          roomId = id;
        }
      } else {
        var id = generateRandomString(20);
        firestoreService.firestore.collection('gameRoom').doc(id).set({
          'id': id,
          'status': 'search',
          'point':codePoint,
          'users': FieldValue.arrayUnion([
            {'id': baseData.user!.id!, 'name': baseData.user!.fullName}
          ]),
          'eventId':docId,
        });
        roomId = id;
      }
    });
    setInitialised(true);
    notifyListeners();


  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }
}
