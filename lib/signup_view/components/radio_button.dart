import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Radiobutton extends StatefulWidget {
  const Radiobutton({super.key});

  @override
  State<Radiobutton> createState() => _RadiobuttonState();
}

class _RadiobuttonState extends State<Radiobutton> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return SizedBox(
      // height: SizeConfig.screenHeight * 0.3,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lĩnh vực của bạn là :',
            style: PrimaryFont.regular(14).copyWith(
                color: AppColors.primaryTextColor, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyRadioListTile<int>(
                      value: 1,
                      groupValue: _value,
                      // leading: 'A',
                      title: Text('Bác Sĩ'),
                      onChanged: setNhomNganh,
                    ),
                    MyRadioListTile<int>(
                      value: 2,
                      groupValue: _value,
                      // leading: 'B',
                      title: Text('Dược Sĩ'),
                      onChanged: setNhomNganh,
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyRadioListTile<int>(
                      value: 3,
                      groupValue: _value,
                      // leading: 'C',
                      title: Text('Nhà Thuốc'),
                      onChanged: setNhomNganh,
                    ),
                    MyRadioListTile<int>(
                      value: 4,
                      groupValue: _value,
                      // leading: 'D',
                      title: Text('Phòng Khám'),
                      onChanged: setNhomNganh,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void setNhomNganh(value) => setState(() => _value = value!);
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  // final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    // required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _customRadioButton,
            SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return SizedBox(
        child: CircleAvatar(
      radius: 15,
      backgroundColor: AppColors.kPrimaryColor.withOpacity(0.6),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            isSelected ? Icons.check : null,
            color: isSelected ? AppColors.whiteColor : null,
          )),
    ));
  }
}
