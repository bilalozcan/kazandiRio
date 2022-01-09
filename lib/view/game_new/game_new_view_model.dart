import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:stacked/stacked.dart';

class GameNewViewModel extends BaseViewModel{
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
   CountDownController? countDownController;
  BaseData baseData = BaseData.instance!;
  bool _isSelected = false;
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  bool get isSelected => _isSelected;

  set isSelected(bool value) {
    _isSelected = value;
    notifyListeners();
  }

  var question;

  init(String category)async{
    setInitialised(false);
    countDownController = CountDownController();
    while(question==null){
      question =await firestoreService.getQuestion(category).then((value) {
        if(value.docs.isNotEmpty){
          var rnd  = Random();
          var index = rnd.nextInt(value.docs.length);
          return value.docs[index].data();
        }
        else return null;
      });
    }
    // countDownController.start();
    setInitialised(true);
    notifyListeners();
  }
}