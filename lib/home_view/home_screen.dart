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
        // leading: IconButton(
        //   onPressed: () => Navigator.pushNamed(context, RouteName.homeScreen),
        //   icon: Icon(
        //     Icons.menu,
        //     color: AppColors.whiteColor,
        //     size: 30,        //   ),
        // ),
        backgroundColor: AppColors.kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Trang Chủ',
          style: PrimaryFont.bold(24).copyWith(color: AppColors.whiteColor),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
        //     child: Badge(
        //       position: BadgePosition.topEnd(top: 5, end: 5),
        //       badgeAnimation: BadgeAnimation.slide(),
        //       // showBadge: _showCartBadge,
        //       badgeStyle: const BadgeStyle(badgeColor: AppColors.alertColor),
        //       badgeContent: Text(
        //         '3',
        //         style: PrimaryFont.regular(12)
        //             .copyWith(color: AppColors.whiteColor),
        //       ),
        //       child: IconButton(
        //         icon: const Icon(
        //           Icons.add_alert,
        //           size: 30,
        //         ),
        //         onPressed: (() {}),
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Body(),
      // drawer: Drawer(
      //   child: SingleChildScrollView(
      //     child: SizedBox(
      //       child: Column(
      //         children: [
      //           MyHeaderDrawer(),
      //           MyDrawerList(),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // bottomNavigationBar: const DashboardNavBar(selectedMenu: MenuState.home),
    );
  }
}
