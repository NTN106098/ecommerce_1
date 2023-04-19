import 'package:ecommerce_app_fhh_02/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/utils.dart';

class InputBirthDay extends StatefulWidget {
  const InputBirthDay({super.key});

  @override
  State<InputBirthDay> createState() => _InputBirthDayState();
}

class _InputBirthDayState extends State<InputBirthDay> {
  final _formKey = GlobalKey<FormState>();
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
//  DateTime selectedDate = DateTime.now();
//   TextEditingController _date = new TextEditingController();

//   Future<Null> _selectedDate(BuildContext context) async {
//     DateFormat formatter = DateFormat('dd/MM/yyyy');
//     final DateTime picker = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(1950,1),
//         lastDate:DateTime(2100) );
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
