import 'package:flutter/cupertino.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
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
  ScrollController scrollController = ScrollController();
  final String userId ='1';
   String eventId='';


  init( String eventID){
    setInitialised(false);
    eventId = eventID;
    setInitialised(true);
  }

  userEventAddFunc()async {
    await firestoreService.addEventUser(eventId, userId);
  }
  userEventDeleteFunc()async {
    await firestoreService.deleteEventUser(eventId, userId);
  }
  getUserCode()async{
   return  await firestoreService.getUserCode(userId).then((value) {
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
    await firestoreService.addMessage(map, eventId,codeId,userId);
    notifyListeners();
  }
}