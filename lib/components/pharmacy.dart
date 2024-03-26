// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class pharmacyModel extends StatelessWidget {
  const pharmacyModel(
      {super.key, this.image, this.name, this.area, this.appointments});

  final String? image;
  final String? name;
  final String? area;
  final String? appointments;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 105,
            width: 300,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(image!),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    name!,
                    style: const TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    area!,
                    style: const TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 17,
                      color: Color(0xff858585),
                    ),
                  ),
                  Text(
                    appointments!,
                    style: const TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              )
            ]),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
