import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/models/user_model.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";
  ThemeMode theme = ThemeMode.light;
  UserModel? userModel;
  User? firebaseUser;
  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      initUser();
    }
  }
  changeTheme(ThemeMode mode) {
    theme = mode;

    notifyListeners();
  }

  changeLanguage(String langCode) {
    local = langCode;
    notifyListeners();
  }
  initUser(){

  }

}
