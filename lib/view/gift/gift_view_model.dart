import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:stacked/stacked.dart';

class GiftViewModel extends BaseViewModel{
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;

  var _gift;

  get gift => _gift;

  set gift(value) {
    _gift = value;
    notifyListeners();
  }

  init()async {
    setInitialised(false);
    gift = await firestoreService.firestore.collection('gift').get().then((value) {
      var lis = [];
      for(var i in value.docs)
        lis.add(i.data());
      return lis;
    });
    setInitialised(true);
    notifyListeners();

  }

}