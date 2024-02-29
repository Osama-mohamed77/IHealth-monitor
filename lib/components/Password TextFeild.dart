// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class PFromTextFaild extends StatelessWidget {
  PFromTextFaild({super.key, this.labelText, this.onChange});
  final String? labelText;
  Function(String)? onChange;
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'please enter your Password';
          } else {
            if (!regex.hasMatch(value)) {
              return 'Enter valid password';
            }
            return null;
          }
        },
        onChanged: onChange,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white70,
            labelText: labelText),
      ),
    );
  }
}
