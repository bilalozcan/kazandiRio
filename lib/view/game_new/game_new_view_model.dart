import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:stacked/stacked.dart';

class GameNewViewModel extends BaseViewModel{
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
  late CountDownController countDownController;
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

  init(String rivalUserId,String category)async{
    setInitialised(false);
    // countDownController = CountDownController();
    while(question==null){
      question =await firestoreService.getQuestion(category).then((value) {
        if(value.docs.isNotEmpty){
          return value.docs.first.data();
        }
        else return null;
      });
    }
    // countDownController.start();
    setInitialised(true);
    notifyListeners();

  }
}