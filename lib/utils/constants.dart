import 'package:flutter/material.dart';

// const kPrimaryColor = Color.fromARGB(255, 19, 146, 36);
//
// const kPrimaryLightColor = Color(0xFFFFECDF);
// const inActiveIconColor = Color(0xFFB6B6B6);
//
// const kPrimaryGradientColor = LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [Color(0xFF496AE1), Color(0xFFCE48B1)]);
//
// const kSecondaryColor = Color(0xFF979797);
// const kTextColor = Color(0xFF757575);
//
// const kAnimationDuration = Duration(microseconds: 200);
//
// final headingStyle = TextStyle(
//     fontSize: getProportionateScreenWidth(28),
//     fontWeight: FontWeight.bold,
//     color: Colors.black,
//     height: 1.5);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kUserNameNullError = "Vui lòng nhập tên của bạn";
const String kShortNameError = "Tên quá ng";

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

class PrimaryFont {
  static String fontFamily = 'Montserrat';

  static TextStyle thin(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w100, fontSize: size);
  }

  static TextStyle light(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w300, fontSize: size);
  }

  static TextStyle regular(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w400, fontSize: size);
  }

  static TextStyle medium(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: size);
  }

  static TextStyle bold(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w700, fontSize: size);
  }
}
