import 'package:flutter/material.dart';

import '../utils/utils.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color, textColors;
  final bool loading;
  const RoundButton(
      {Key? key,
      required this.title,
      required this.onPress,
      this.color = AppColors.kPrimaryColor,
      this.textColors = AppColors.whiteColor,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: getProportionateScreenHeight(50),
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: PrimaryFont.bold(16).copyWith(color: textColors),
                ),
              ),
      ),
    );
  }
}
