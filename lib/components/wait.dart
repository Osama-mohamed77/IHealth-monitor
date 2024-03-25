// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class waitCont extends StatelessWidget {
  const waitCont({
    super.key,
    this.color,
    this.date,
  });
  final Color? color;
  final String? date;

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
            height: 12,
          ),
          Container(
            height: 1,
            width: 12,
            decoration: const BoxDecoration(color: Colors.black),
          )
        ],
      ),
    );
  }
}
