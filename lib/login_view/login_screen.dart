import 'package:ecommerce_app_fhh_02/login_view/components/body.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
