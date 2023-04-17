import 'package:ecommerce_app_fhh_02/models/store_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CardStoreItem extends StatelessWidget {
  const CardStoreItem({
    Key? key,
    required this.storeModel,
    required this.onPress,
  }) : super(key: key);
  final StoreModel storeModel;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: getProportionateScreenHeight(150),
        margin: EdgeInsets.all(8),
        child: Stack(
          children: [
            Container(
              height: getProportionateScreenHeight(120),
              width: SizeConfig.screenWidth * 0.65,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(width: 1)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  storeModel.images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 5,
              bottom: 10,
              child: Stack(
                children: [
                  SizedBox(
                    // width: SizeConfig.screenWidth * 0.62,
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: SizeConfig.screenWidth * 0.58,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    AppColors.secondaryColor.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  storeModel.nameStore,
                                  style: PrimaryFont.medium(12).copyWith(
                                      color: AppColors.primaryTextColor),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        children: List.generate(
                                            5,
                                            (index) => Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 16,
                                                )),
                                      ),
                                      Text(
                                        '(54)',
                                        style: PrimaryFont.thin(10).copyWith(
                                            color: AppColors.secondaryColor),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: getProportionateScreenHeight(30),
                right: getProportionateScreenWidth(10),
                child: Container(
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenWidth(100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.kPrimaryColor),
                  child: Center(
                    child: Text(
                      'Phổ biến',
                      style: PrimaryFont.medium(12)
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
