// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      children: [
        SizedBox(
          height: 60,
          width: 65,
          child: TextFormField(
            onSaved: (newValue) {},
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter the 4 digit code';
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: '0',
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 193, 193, 193), height: 1),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255)),
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        )
      ],
    ));
  }
}
