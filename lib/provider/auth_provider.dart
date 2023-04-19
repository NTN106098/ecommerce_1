// import 'package:flutter/material.dart';

// class AuthProvider extends ChangeNotifier {
//   Future<String,dynamic> register(String name, int phone) async{
//     final Map<String,dynamic> apiBodyData {

//     }
// }
import 'dart:convert';

import 'package:ecommerce_app_fhh_02/home_view/home_screen.dart';
import 'package:ecommerce_app_fhh_02/models/user_model.dart';
import 'package:ecommerce_app_fhh_02/utils/shared_preference.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void login(
    BuildContext context,
    String email,
  ) async {
    _isLoading = true;
    notifyListeners();

    String urls = 'https://duocgiasi.com/login/?email=';
    final response = await http.post(Uri.parse(urls), body: ({"phone": email}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> responData = json.decode(response.body);

      // print(responData);
      // var userData = responData['content'];

      // User authUser = User.fromJson(userData);

      // UserPreferences().saveUser(authUser);

      print(response.body);
      print('objeLogin successfull');
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => HomeScreen())));
      notifyListeners();
    } else {
      print(response.statusCode);
      // print(response.body);
      notifyListeners();
    }
    notifyListeners();
  }
}
