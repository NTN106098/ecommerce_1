import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'components/homeView_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Trang Chủ',
          style: PrimaryFont.bold(24).copyWith(color: AppColors.whiteColor),
        ),
      ),
      body: Body(),
    );
  }
}
