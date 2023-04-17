import 'package:ecommerce_app_fhh_02/signup_view/components/input_birthday.dart';
import 'package:ecommerce_app_fhh_02/signup_view/components/radio_button.dart';
import 'package:ecommerce_app_fhh_02/widgets/input_text_field.dart';
import 'package:ecommerce_app_fhh_02/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../../utils/utils.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final _keyboard = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0'];
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  // final MyTextController _nameSate = MyTextController();
  // final MyTextController _phoneState = MyTextController();

  // final _email = TextField();
  final List<String> errors = [];
  // final Validation _validation = Validation(2);

  // _signup() {}

  // bool validate() {
  //   _validation.clearError(_nameSate, 1);
  //   _validation.clearError(_phoneState, 2);

  //   bool validate = true;

  //    if (_nameController.text.trim().isEmpty) {
  //     _validation.showError(_nameState, getTranslated(context, 'cannot_empty'), 1);
  //     validation = false;
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    phoneController.dispose();
    phoneFocusNode.dispose();
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

  void login(int phone, String name) async {
    try {
      Response response = await post(
          Uri.parse('https://duocgiasi.com/login/register'),
          body: {'name': name, 'phone': phone});

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('account created successf');
      } else {
        print('faild');
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
                          } else if (value.length < 4) {
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
            Radiobutton(),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            InputBirthDay(),
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
                debugPrint('on Tap');
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
}

// class Validation {
//   bool? _isError;
//   String? _errorMessage;
//   List<bool>? _validateError;
//   List<String>? _validateMessages;

//   Validation(int fieldNumber) {
//     _isError = false;
//     _errorMessage = '';
//     _validateError = List.generate(fieldNumber, (index) => false);
//     _validateMessages = List.generate(fieldNumber, (index) => '');
//   }

//   String? get errorMessage => _errorMessage;
//   bool? get isError => _isError;
//   bool error(index) => _validateError![index];
//   String message(index) => _validateMessages![index];

//   set errorMessage(String? value) {
//     _errorMessage = value;
//   }

//   set isError(bool? value) {
//     _isError = value;
//   }

//   _setMessage(index, message) {
//     _validateMessages![index] = message;
//   }

//   _setError(index, error) {
//     _validateError![index] = error;
//   }

//   showError(MyTextController state, String error, int index) {
//     state.setError(error);
//     state.alertError();
//     _setError(index, true);
//     _setMessage(index, error);
//   }

//   clearError(MyTextController state, int index) {
//     state.resetError();
//     _setError(index, false);
//     _setMessage(index, '');
//   }
// }
