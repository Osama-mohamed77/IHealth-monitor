import 'package:flutter/material.dart';

class DayCont extends StatelessWidget {
  const DayCont({super.key, this.day});
  final String? day;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: Colors.white),
      child: Text(
        textAlign: TextAlign.center,
        day!,
        style: const TextStyle(
            fontFamily: 'alata', fontSize: 9, color: Colors.black),
      ),
    );
  }
}
