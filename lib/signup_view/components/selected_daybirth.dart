import 'package:ecommerce_app_fhh_02/signup_view/components/input_birthday.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class SelectedBirthDay extends StatefulWidget {
  const SelectedBirthDay({super.key});

  @override
  State<SelectedBirthDay> createState() => _SelectedBirthDayState();
}

class _SelectedBirthDayState extends State<SelectedBirthDay> {
  // final formKey = GlobalKey<FormState>();
  // final dateInput = TextEditingController();
  // String name = '';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   dateInput.text = "";
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ngày sinh của bạn :',
              style: PrimaryFont.regular(14).copyWith(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
              )),
          InputBirthDay(),

          // GestureDetector(
          //   child: TextField(
          //     style: TextStyle(
          //       color: Colors.black,
          //     ),
          //     controller: dateInput,
          //     decoration: InputDecoration(
          //         labelStyle: TextStyle(color: Colors.white),
          //         icon: Icon(Icons.calendar_today),
          //         iconColor: Colors.white, //icon of text field
          //         labelText: "Enter Date Of Birth" //label text of field
          //         ),
          //     readOnly: true,
          //     onTap: () async {
          //       DateTime? pickedDate = await showDatePicker(
          //           context: context,
          //           initialDate: DateTime.now(),
          //           firstDate: DateTime(
          //               1900), //DateTime.now() - not to allow to choose before today.
          //           lastDate: DateTime(2040));

          //       if (pickedDate != null) {
          //         print(
          //             pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          //         String formattedDate =
          //             DateFormat('dd-MM-yyyy').format(pickedDate);
          //         print(
          //             formattedDate); //formatted date output using intl package =>  2021-03-16
          //         //you can implement different kind of Date Format here according to your requirement

          //         setState(() {
          //           dateInput.text =
          //               formattedDate; //set output date to TextField value.
          //         });
          //       } else {
          //         print("Date is not selected");
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
