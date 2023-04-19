import 'package:ecommerce_app_fhh_02/api/api_link.dart';
import 'package:ecommerce_app_fhh_02/api/api_servirce.dart';
import 'package:ecommerce_app_fhh_02/models/request.dart';
import 'package:ecommerce_app_fhh_02/models/validatation.dart';
import 'package:ecommerce_app_fhh_02/signup_view/components/radio_button.dart';
import 'package:ecommerce_app_fhh_02/widgets/input_text_field.dart';
import 'package:ecommerce_app_fhh_02/widgets/my_text_field.dart';
import 'package:ecommerce_app_fhh_02/widgets/round_button.dart';
import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

enum Linhvuc { bacsi, duocsi, nhathuoc, phongkham }

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  final phoneState = MyTextController();

  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  final dayFocusNode = FocusNode();
  final monthFocusNode = FocusNode();
  final yearFocusNode = FocusNode();

  final List<String> errors = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    phoneController.dispose();
    phoneFocusNode.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    dayFocusNode.dispose();
    monthFocusNode.dispose();
    yearFocusNode.dispose();
  }

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  _signUp() {
    if (validate()) {
      ApiServices().post(
          ApiUrl.LINK_API_SIGN_UP,
          RequestAPP.signUpRequest(
              name: nameController.text.trim(),
              phone: phoneController.text.trim(),
              is_style: _linhvuc,
              birthday: dayController.text.trim() +
                  '/' +
                  monthController.text.trim() +
                  '/' +
                  yearController.text.trim()));
    }
  }

  String _linhvuc = 'bacsi';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * .01,
            ),
            Text(
              'Welcome to FHH - GLOBAL',
              style:
                  PrimaryFont.bold(24).copyWith(color: AppColors.kPrimaryColor),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .01,
            ),
            Text(
              'Nhập số điện thoại của bạn\n để đăng ký thành viên',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .01,
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(30),
                      bottom: getProportionateScreenHeight(10)),
                  child: Column(
                    children: [
                      InputTextField(
                        mycontroller: nameController,
                        foucusNode: nameFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          // return value.isEmpty ? 'enter userName' : null;
                          if (value!.isEmpty) {
                            addError(error: kUserNameNullError);
                            return "";
                          } else if (value.length < 16) {
                            addError(error: kShortNameError);
                            return "";
                          }
                          return null;
                        },
                        keyBoardType: TextInputType.emailAddress,
                        hint: 'Nhập họ và tên',
                        obscureText: false,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * .01,
                      ),
                      InputTextField(
                        mycontroller: phoneController,
                        foucusNode: phoneFocusNode,
                        onFiledSubmittedValue: (value) {},
                        onValidator: (value) {
                          // return value.isEmpty ? 'enter userName' : null;
                          if (value.isEmpty) {
                            return " Vui lòng nhập số điện thoại";
                          }
                          return null;
                        },
                        keyBoardType: TextInputType.phone,
                        hint: 'Số điện thoại',
                        obscureText: false,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * .01,
                      ),
                    ],
                  ),
                )),
            // FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            SizedBox(
              // height: SizeConfig.screenHeight * 0.3,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lĩnh vực của bạn là :',
                    style: PrimaryFont.regular(14).copyWith(
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyRadioListTile(
                                value: 'bacsi',
                                groupValue: _linhvuc,
                                // leading: 'A',
                                title: Text('Bác Sĩ'),
                                onChanged: setNhomNganh,
                              ),
                              MyRadioListTile(
                                value: 'duocsi',
                                groupValue: _linhvuc,
                                // leading: 'B',
                                title: Text('Dược Sĩ'),
                                onChanged: setNhomNganh,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyRadioListTile(
                                value: 'nhathuoc',
                                groupValue: _linhvuc,
                                // leading: 'C',
                                title: Text('Nhà Thuốc'),
                                onChanged: setNhomNganh,
                              ),
                              MyRadioListTile<String>(
                                value: 'phongkham',
                                groupValue: _linhvuc,
                                // leading: 'D',
                                title: Text('Phòng Khám'),
                                onChanged: ((value) {
                                  setState(() {
                                    _linhvuc = value!;
                                    print(value);
                                  });
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // SizedBox(
                      //   height: 50,
                      //   width: 100,
                      //   child: TextField(
                      //     controller: dayController,
                      //     focusNode: dayFocusNode,
                      //     decoration: InputDecoration(hintText: 'ngày'),
                      //   ),
                      // ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: InputTextField(
                            mycontroller: dayController,
                            foucusNode: dayFocusNode,
                            onFiledSubmittedValue: (newValue) {},
                            onValidator: (value) {
                              if (value!.isEmpty) {
                                addError(error: kPassNullError);
                                return "";
                              } else if (value > 0 && value < 32) {
                                addError(error: "hãy nhập đúng ngày sinh");
                              }
                            },
                            keyBoardType: TextInputType.number,
                            hint: 'ngày...',
                            obscureText: false),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: InputTextField(
                            mycontroller: monthController,
                            foucusNode: monthFocusNode,
                            onFiledSubmittedValue: (newValue) {},
                            onValidator: (value) {},
                            keyBoardType: TextInputType.number,
                            hint: 'tháng...',
                            obscureText: false),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: InputTextField(
                            mycontroller: yearController,
                            foucusNode: yearFocusNode,
                            onFiledSubmittedValue: (newValue) {},
                            onValidator: (value) {},
                            keyBoardType: TextInputType.datetime,
                            hint: 'năm...',
                            obscureText: false),
                      ),
                    ],
                  ),
                  // FormError(errors: errors)
                ],
              ),
            ),
            // SelectedBirthDay(),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            RoundButton(
              title: 'Đăng ký',
              // loading: provider.loading,
              onPress: () {
                print(RequestAPP.signUpRequest(
                    name: nameController.text.trim(),
                    phone: phoneController.text.trim(),
                    is_style: _linhvuc.toString(),
                    birthday: dayController.text.trim() +
                        '/' +
                        monthController.text.trim() +
                        '/' +
                        yearController.text.trim()));
                debugPrint('on Tap + ${_signUp()}');
                _signUp();
              },
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .01,
            ),
            InkWell(
              onTap: () {
                // Navigator.pushNamed(context, RouteName.loginScreen);
              },
              child: Text.rich(TextSpan(
                  text: "Bạn đã có tài khoản?",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 15),
                  children: [
                    TextSpan(
                        text: "Login",
                        style: PrimaryFont.medium(16)
                            .copyWith(color: AppColors.kPrimaryColor))
                  ])),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: 'Chú Ý:\n',
                  style: PrimaryFont.bold(16)
                      .copyWith(color: AppColors.alertColor, height: 1.6),
                  children: [
                    TextSpan(
                        text:
                            'Vui lòng đăng ký tài khoản, xác nhận bạn là dược sĩ, bác sĩ, chuyên viên y khoa... có nhu cầu tìm kiếm sản phẩm thuốc\n',
                        style: PrimaryFont.regular(14).copyWith(
                            color: AppColors.primaryTextColor,
                            overflow: TextOverflow.ellipsis,
                            height: 1.8)),
                    TextSpan(
                        text:
                            'Website chúng tôi không bán thuốc cho bệnh nhân mua dùng.. Việc sử dụng thuốc phải tuân theo hướng dẫn của Y bác sĩ và dược sĩ có chuyên môn.\n',
                        style: PrimaryFont.regular(14).copyWith(
                            color: AppColors.primaryTextColor,
                            overflow: TextOverflow.ellipsis,
                            height: 1.8)),
                    TextSpan(
                        text:
                            'Nếu quý khách cần được hỗ trợ về Đăng kí - Đăng nhập tài khoản có thể gọi hoặc nhắn tin Zalo số hotline: 093.655.4643',
                        style: PrimaryFont.regular(14).copyWith(
                            color: AppColors.primaryTextColor,
                            overflow: TextOverflow.ellipsis,
                            height: 1.8)),
                  ]),
            ),
          ],
        ),
      ),
    ));
  }

  void setNhomNganh(value) {
    setState(() {
      _linhvuc = value;
    });
  }

  final Validation _validation = Validation(1);

  bool validate() {
    bool validation = true;

    if (phoneController.text.trim().isEmpty) {
      print(_validation);
    }

    return validation;
  }
}
