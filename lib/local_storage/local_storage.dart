import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalStorage extends ChangeNotifier{
  int index=0;
  bool obsecurePassword=true;
  String? email;
  storeEmail(String email)async{
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setString('email', email);
    notifyListeners();
  }

  removeEmail()async{
    SharedPreferences store = await SharedPreferences.getInstance();
    store.remove('email');
    notifyListeners();
  }

  loadEmail()async{
    SharedPreferences store = await SharedPreferences.getInstance();
    email= store.getString('email');
    notifyListeners();
  }

}