import 'package:flutter/cupertino.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';

class LeaderBoardViewModel extends CustomBaseViewModel{
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
  BaseData baseData = BaseData.instance!;

  List _leaderTableList=[];
  List get leaderTableList => _leaderTableList;
  set leaderTableList(List value) {
    _leaderTableList = value;
    notifyListeners();
  }

  void initialize(BuildContext context) async {
    setInitialised(false);
    this.context = context;
    leaderTableList = await firestoreService.firestore.collection('leaderBoard').orderBy('point',descending: true).get().then((value){
      var list=[];
      if(value.docs.isNotEmpty){
        for(var i in value.docs){
          list.add(i.data());
        }
      }
      return list;
    });
    setInitialised(true);
    notifyListeners();
  }
}