import 'package:ecommerce_app_fhh_02/widgets/input_text_field.dart';
import 'package:ecommerce_app_fhh_02/widgets/round_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  final phoneFocusNode = FocusNode();

  final List<String> errors = [];

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Text(
                'Welcome to FHH - GLOBAL',
                style: PrimaryFont.bold(24)
                    .copyWith(color: AppColors.kPrimaryColor),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * .01,
              ),
              Text(
                'Enter your email address\nto connect to your account',
                style: PrimaryFont.regular(16)
                    .copyWith(color: AppColors.primaryTextColor),
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
                          mycontroller: phoneController,
                          foucusNode: phoneFocusNode,
                          onFiledSubmittedValue: (newValue) {},
                          onValidator: (value) {
                            if (value!.isEmpty) {
                              addError(error: kEmailNullError);
                              return "";
                            } else if (!emailValidatorRegExp.hasMatch(value)) {
                              addError(error: kInvalidEmailError);
                              return "";
                            }
                            return null;
                          },
                          keyBoardType: TextInputType.emailAddress,
                          hint: 'Email',
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * .01,
                        ),
                      ],
                    ),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, RouteName.forgotPassword);
                  },
                  child: Text('Forgot Password?',
                      style: PrimaryFont.medium(15)
                          .copyWith(decoration: TextDecoration.underline)
                      // Theme.of(context).textTheme.headline2!.copyWith(
                      //     fontSize: 15, decoration: TextDecoration.underline),
                      ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              RoundButton(title: 'Đăng Nhập', onPress: () {}),
              // ChangeNotifierProvider(
              //   create: (_) => LoginController(),
              //   child: Consumer<LoginController>(
              //     builder: (context, provider, child) {
              //       return RoundButton(
              //         title: 'Login',
              //         loading: provider.loading,
              //         onPress: () {
              //           if (_formKey.currentState!.validate()) {
              //             provider.login(context, emailController.text,
              //                 passwordController.text);
              //           }
              //         },
              //       );
              //     },
              //   ),
              // ),
              SizedBox(
                height: SizeConfig.screenHeight * .01,
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, RouteName.signUpScreen);
                  // Navigator.pushNamed(context, RouteName.signUpScreen);
                },
                child: Text.rich(TextSpan(
                    text: "Don't have an acount?",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 15),
                    children: [
                      TextSpan(
                          text: "Sign Up",
                          style: PrimaryFont.medium(16)
                              .copyWith(color: AppColors.kPrimaryColor))
                    ])),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SocalCard(
              //       icon: "assets/icons/google.svg",
              //       press: () {},
              //     ),
              //     SocalCard(
              //       icon: "assets/icons/facebook.svg",
              //       press: () {},
              //     ),
              //     SocalCard(
              //       icon: "assets/icons/twitter.svg",
              //       press: () {},
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
