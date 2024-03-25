// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  final TextEditingController mycontroller;
  RegExp regexEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  CustomTextForm(
      {super.key, required this.labelText, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: SizedBox(
            height: 65,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Your Email';
                } else if (!regexEmail.hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
              controller: mycontroller,
              decoration: InputDecoration(
                labelText: labelText,
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 184, 184, 184),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
