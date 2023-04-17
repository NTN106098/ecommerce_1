import 'package:flutter/material.dart';

import '../utils/utils.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController mycontroller;
  final FocusNode foucusNode;
  final FormFieldSetter onFiledSubmittedValue;
  final FormFieldValidator onValidator;

  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable, autoFoucus;

  const InputTextField(
      {Key? key,
      required this.mycontroller,
      required this.foucusNode,
      required this.onFiledSubmittedValue,
      required this.onValidator,
      required this.keyBoardType,
      required this.hint,
      required this.obscureText,
      this.enable = true,
      this.autoFoucus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      focusNode: foucusNode,
      obscureText: obscureText,
      onFieldSubmitted: onFiledSubmittedValue,
      validator: onValidator,
      // onChanged: onChange,
      keyboardType: keyBoardType,
      cursorColor: AppColors.primaryTextColor,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(height: 0, fontSize: 19),
      decoration: InputDecoration(
        hintText: hint,
        enabled: enable,
        // filled: true,
        // fillColor: Colors.black,
        contentPadding: const EdgeInsets.all(10),
        hintStyle: PrimaryFont.regular(14).copyWith(
          height: 0,
          color: AppColors.primaryTextColor.withOpacity(0.8),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputTextBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.alertColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.textFieldDefaultBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}
