import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CardUserInfor extends StatelessWidget {
  const CardUserInfor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: getProportionateScreenHeight(150),
          width: double.infinity,
          color: AppColors.kPrimaryColor,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          height: SizeConfig.screenHeight * 0.25,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: AppColors.secondaryColor.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
                    child: SizedBox(
                      width: SizeConfig.screenWidth * 0.5,
                      child: Text.rich(
                          // style: PrimaryFont.medium(16).copyWith(color: AppColors.primaryTextColor),
                          TextSpan(children: [
                        TextSpan(
                          text: 'Nghia Nguyen\n',
                          style: PrimaryFont.bold(18)
                              .copyWith(color: AppColors.primaryTextColor),
                        ),
                        TextSpan(
                            text: 'Thành viên\n',
                            style: PrimaryFont.medium(12).copyWith(
                                color: AppColors.secondaryTextColor,
                                height: 1.9)),
                        TextSpan(
                            text: 'Hạng bạc',
                            style: PrimaryFont.medium(12).copyWith(
                                color: AppColors.rankTextColor, height: 1.9))
                      ])),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      height: getProportionateScreenHeight(40),
                      width: getProportionateScreenWidth(100),
                      // width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '30 Diem',
                          style: PrimaryFont.bold(12)
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                endIndent: 20,
                thickness: 1,
                indent: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     CricleButton(
              //       svgIconPath: qrcodePointPath,
              //       text: 'Tích điểm',
              //       onPress: () {
              //         print('Tich diem');
              //       },
              //     ),
              //     CricleButton(
              //       svgIconPath: cartIdPath,
              //       text: 'Thành viên',
              //       onPress: () {
              //         print('thành viên');
              //       },
              //     ),
              //     CricleButton(
              //       svgIconPath: discountPath,
              //       text: 'Phiếu giảm giá',
              //       onPress: () {
              //         Navigator.pushNamed(context, RouteName.discountScreen);
              //         print('phiếu giảm giá');
              //       },
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ],
    );
  }
}

// class UserInfomation extends StatelessWidget {
//   const UserInfomation({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ref = FirebaseDatabase.instance.ref('User');
//     return StreamBuilder(
//         stream: ref.child(SessionController().userId.toString()).onValue,
//         builder: (context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasData) {
//             Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
//             return 
//           }
//           return Center(
//             child: Text('Some thing worrong'),
//           );
//         });
//   }
// }
