import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:stacked/stacked.dart';

class GameViewModel extends BaseViewModel{
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
  BaseData baseData = BaseData.instance!;
  var _rivalUser;

  get rivalUser => _rivalUser;

  set rivalUser(value) {
    _rivalUser = value;
    notifyListeners();
  }

  init(String docId)async{
    setInitialised(false);
    while(rivalUser==null){
      var data =  await firestoreService.getLivesUserStreamCode(docId,baseData.user!.id!).then((value) {
        if(value.docs.isNotEmpty){
          rivalUser = value.docs.first.data();
        }
      });
    }
    setInitialised(true);
    notifyListeners();
  }
}