import 'package:flutter/material.dart';

class DateCont extends StatelessWidget {
  const DateCont({super.key, this.color, this.date, this.measurement});
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
