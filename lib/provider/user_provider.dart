import 'package:ecommerce_app_fhh_02/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User();
  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
