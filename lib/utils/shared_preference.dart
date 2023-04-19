import 'package:ecommerce_app_fhh_02/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('name', user.name.toString());
    prefs.setString('phone', user.phone.toString());
    prefs.setString('is_style', user.is_style.toString());
    prefs.setString('birthday', user.birthday.toString());

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString('name').toString();
    String phone = prefs.getString('phone').toString();
    String is_style = prefs.getString('is_style').toString();
    String birthday = prefs.getString('birthday').toString();

    return User(
        name: name, phone: phone, is_style: is_style, birthday: birthday);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('phone');
    prefs.remove('is_style');
    prefs.remove('birthday');
  }
}
