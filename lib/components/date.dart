// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class dateCont extends StatelessWidget {
  const dateCont({super.key, this.color, this.date, this.measurement});
  final Color? color;
  final String? date;
  final String? measurement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          Text(
            date!,
            style: const TextStyle(
                fontFamily: 'alata', fontSize: 10, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(measurement!,
              style: const TextStyle(
                  fontFamily: 'alata', fontSize: 9, color: Colors.black))
        ],
      ),
    );
  }
}
