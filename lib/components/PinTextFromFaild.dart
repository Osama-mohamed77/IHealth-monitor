// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class PinTextFromFaild extends StatelessWidget {
  PinTextFromFaild({super.key, this.labelText, this.onChange});
  final String? labelText;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
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
