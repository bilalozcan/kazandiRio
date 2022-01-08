import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:stacked/stacked.dart';

class GameNewViewModel extends BaseViewModel{
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;

  var question;



  init(String rivalUserId,String category)async{
    setInitialised(false);
    while(question==null){
      question =await firestoreService.getQuestion(category).then((value) {
        if(value.docs.isNotEmpty){
          return value.docs.first.data();
        }
        else return null;
      });
    }
    setInitialised(true);
    notifyListeners();

  }
}