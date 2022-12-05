import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel();

  void saveUserData(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  UserModel get getUserData => _userModel;
}