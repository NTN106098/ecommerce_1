import 'dart:async';
import 'dart:convert';

import 'package:ecommerce_app_fhh_02/api/api_link.dart';
import 'package:ecommerce_app_fhh_02/models/user_model.dart';
import 'package:ecommerce_app_fhh_02/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class SignUpProvider extends ChangeNotifier {
  Status _registeredInStatus = Status.NotRegistered;

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  // Future<Map<String, dynamic>> register(
  //     String name, String phone, String is_style, String birthday) async {
  //   final Map<String, dynamic> apiBodyData = {
  //     'name': name,
  //     'phone': phone,
  //     'is_style': is_style,
  //     'birthday': birthday
  //   };
  //   return await post(ApiUrl.LINK_API_REGISTER,
  //           body: json.encode(apiBodyData),
  //           headers: {'Content-Type': 'application/json'})
  //       .then(onValue)
  //       .catchError(onError);
  // }

  static Future<FutureOr> onValue(Response response) async {
    var result;

    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var userData = responseData['data'];

      User authUser = User.fromJson(responseData);

      UserPreferences().saveUser(authUser);

      result = {
        'status': true,
        'message': "Đăng ký thành công",
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': "Đăng ký không thành công",
        'data': responseData
      };
    }
    return result;
  }

  static onError(error) {
    print('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
