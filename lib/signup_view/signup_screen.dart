import 'package:ecommerce_app_fhh_02/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../signup_view/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: Text('SignUp'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
