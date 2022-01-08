import 'package:flutter/cupertino.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:kazandirio/model/user.dart';
import 'package:stacked/stacked.dart';
class Code{
  String? code;
  String? id;
  bool? status;
  Code({
    this.code,
    this.id,
    this.status
});
}
class LiveViewModel extends BaseViewModel{
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
  BaseData baseData = BaseData.instance!;
  ScrollController scrollController = ScrollController();
  late User user;
   String eventId='';
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
         ));
       }
     }
     return codeList;
   });
  }

  addMeesage(var map,String codeId)async {
    await firestoreService.addMessage(map, eventId,codeId,user.id!);
    notifyListeners();
  }
}