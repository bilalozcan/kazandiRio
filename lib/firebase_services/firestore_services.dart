

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceApp {
  static FirestoreServiceApp? _instance;

  static FirestoreServiceApp? get instance {
    _instance ??= FirestoreServiceApp._init();
    return _instance;
  }

  FirestoreServiceApp._init();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream getEventsStream(){
    return firestore.collection('events').snapshots();
  }
  Stream getLivesStream(String id){
    return firestore.collection('eventLive').doc(id).collection('live').orderBy('date',descending: true).snapshots();
  }
  Stream getLivesUserStream(String id){
    return firestore.collection('eventLive').doc(id).collection('users').snapshots();
  }
  Future<QuerySnapshot<Map<String, dynamic>>> getLivesUserStreamCode(String id,String userId){
    return firestore.collection('eventLive').doc(id).collection('live').where('senderId',isNotEqualTo:userId ).where('status',isEqualTo: true).get();
  }
  addMessage(Map<String,dynamic> map, String eventId,String codeId,String userId)async{
    firestore.collection('eventLive').doc(eventId).collection('live').add(map);
    await firestore.collection('usersCode').doc(userId).collection('codes').doc(codeId).update({
      'status':false,
    });
  }
  addEventUser( String eventId,String userId)async{
    await firestore.collection('eventLive').doc(eventId).collection('users').doc(userId).set({
      'id':userId
    });
  }
  deleteEventUser( String eventId,String userId)async{
    await firestore.collection('eventLive').doc(eventId).collection('users').doc(userId).delete();
  }
  Future getUserCode(String userId)async{
    return await firestore.collection('usersCode').doc(userId).collection('codes').where('status',isEqualTo: true).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getQuestion(String category)async{
    return firestore.collection('question').where('category',isEqualTo: category).get();
  }
  
  addCodeUser(Map<String,dynamic> map,String userId)async{
   await firestore.collection('usersCode').doc(userId).collection('codes').doc(map['id']).set(map);
    
  }
  //final NetworkManager _networkManager = NetworkManager.instance!;

}