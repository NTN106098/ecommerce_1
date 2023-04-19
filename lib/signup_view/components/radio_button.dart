import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

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
