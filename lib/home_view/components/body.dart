import 'package:ecommerce_app_fhh_02/home_view/components/card_user_infomation.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> _refresh() {
    setState(() {});
    return Future.value();
  }

  rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardUserInfor(),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hệ thống chuỗi cửa hàng',
                      style: PrimaryFont.bold(18)
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    // SizedBox(
                    //   height: SizeConfig.screenHeight * 0.22,
                    //   child: ListView.builder(
                    //       itemCount: stores.length,
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       itemBuilder: (_, index) {
                    //         if (stores[index].isPopular) {
                    //           return CardStoreItem(
                    //               storeModel: stores[index],
                    //               onPress: () => Navigator.pushNamed(
                    //                   context, RouteName.detailScreen,
                    //                   arguments: StoreDetailArguments(
                    //                       storeModel: stores[index])));
                    //         }
                    //         return const SizedBox();
                    //       }),
                    // ),
                    const SizedBox(height: 10),
                    TitleCustom(
                      title: 'Không thể bỏ qua',
                      text: 'Xem tất cả',
                      onPress: () {
                        print('xem tất cả');
                      },
                    ),
                    // SliderDemo(),
                    SizedBox(
                      height: 10,
                    ),
                    // SizedBox(
                    //   height: SizeConfig.screenHeight * 0.22,
                    //   child: ListView.builder(
                    //       itemCount: stores.length,
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       itemBuilder: (context, index) {
                    //         return ;
                    //       }),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    TitleCustom(
                      title: 'Tin tức mới nhất',
                      text: 'Xem tất cả',
                      onPress: () {
                        print('xem tất cả');
                        // Navigator.pushNamed(context, RouteName.shoppingScreen);
                      },
                    ),
                    // CardItemPost(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: SizeConfig.screenHeight * 0.35,
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // return CardItemPost();
                              return Container();
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          ),
        )),
        onRefresh: _refresh);
  }
}

class TitleCustom extends StatelessWidget {
  final String title, text;
  final Function? onPress;
  const TitleCustom({
    Key? key,
    required this.title,
    required this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              PrimaryFont.bold(16).copyWith(color: AppColors.primaryTextColor),
        ),
        InkWell(
          onTap: onPress as void Function(),
          child: Text(
            text,
            style:
                PrimaryFont.light(12).copyWith(color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
