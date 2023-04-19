import 'package:flutter/material.dart';

import '../utils/utils.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
      {this.label,
      this.hint = '',
      this.height = 40,
      this.isPassword = false,
      this.editingController,
      this.myTextController,
      this.outFocus,
      this.focus,
      this.maxLength,
      this.onChanged,
      this.isError = false,
      this.error = '',
      this.errorHeight = 20,
      this.readOnly = false,
      this.rightIcon,
      this.onTap,
      this.keyboardType,
      Key? key})
      : super(key: key);

  final double height;
  final String? label;
  final String hint;
  final bool? isPassword;
  final TextEditingController? editingController;
  final MyTextController? myTextController;
  final VoidCallback? outFocus;
  final VoidCallback? focus;
  final int? maxLength;
  final Function(String)? onChanged;
  final double? errorHeight;
  final bool readOnly;
  final Widget? rightIcon;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;

  bool isError;
  String error;

  @override
  State<MyTextField> createState() {
    return myTextController ?? _MyTextFieldState();
  }
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isHidePassword = false;
  bool _isFocus = false;

  void alertError() {
    widget.isError = true;
  }

  // void resetError() {
  //   widget.isError = false;
  // }

  void setError(contentError) {
    widget.error = contentError;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isHidePassword = widget.isPassword!;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(16)),
                      child: Text(widget.label!,
                          style: PrimaryFont.medium(14)
                              .copyWith(color: AppColors.primaryTextColor))),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.2,
                  )
                ],
              )
            : Container(),
        Container(
          height: widget.height,
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: widget.isError
                  ? AppColors.alertColor
                  : _isFocus
                      ? AppColors.kPrimaryColor
                      : AppColors.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Row(children: [
            Expanded(
                child: Focus(
              child: TextFormField(
                controller: widget.editingController ?? TextEditingController(),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hint,
                    contentPadding: EdgeInsets.all(0),
                    isDense: true,
                    counterText: ''),
                style: PrimaryFont.medium(13)
                    .copyWith(color: AppColors.primaryTextColor),
                obscureText: _isHidePassword,
                maxLength: widget.maxLength,
                onChanged: (value) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
                readOnly: widget.readOnly,
                onTap: () {
                  if (widget.onTap != null) {
                    widget.onTap!();
                  }
                },
                keyboardType: widget.keyboardType ?? TextInputType.text,
              ),
              onFocusChange: (hasFocus) {
                setState(() {
                  _isFocus = hasFocus;
                });
                if (hasFocus == true) {
                  if (widget.focus != null) widget.focus!();
                } else {
                  if (widget.outFocus != null) widget.outFocus!();
                }
              },
            )),
            widget.rightIcon ?? Container(),
            (widget.isPassword == true
                ? GestureDetector(
                    child: SizedBox(
                      height: SizeConfig.screenHeight * 0.4,
                      width: SizeConfig.screenWidth * 0.5,
                      child: (_isHidePassword == true
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                    ),
                    onTap: () {
                      setState(() {
                        _isHidePassword = !_isHidePassword;
                      });
                    },
                  )
                : Container())
          ]),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 0),
            height: widget.errorHeight,
            child: widget.isError == true
                ? Text(
                    widget.error,
                    style: PrimaryFont.regular(14)
                        .copyWith(color: AppColors.alertColor),
                    textAlign: TextAlign.left,
                  )
                : Container())
      ],
    );
  }
}

class ValidateTextField {
  static bool isEmpty(String? s) {
    if (s == null || s.isEmpty) {
      return true;
    }
    return false;
  }
}

class MyTextController extends _MyTextFieldState {}
