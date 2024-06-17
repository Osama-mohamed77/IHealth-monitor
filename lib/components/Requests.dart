import 'package:flutter/material.dart';

class Requests extends StatelessWidget {
  const Requests({super.key, this.username, this.image, this.name});
  final String? username;
  final String? image;
  final String? name;
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
            decoration: BoxDecoration(
                color: const Color(0xffBBBFC3),
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(image!),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 75),
                    child: Text(
                      username!,
                      style: const TextStyle(
                        fontFamily: 'Alata',
                        fontSize: 25,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      children: [
                        const Text(
                          'Name/',
                          style: TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 13,
                            color: Color(0xff5B5B5B),
                          ),
                        ),
                        Text(
                          name!,
                          style: const TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 13,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        Container(
                          height: 22,
                          width: 74,
                          decoration:
                              const BoxDecoration(color: Color(0xffA7B3A6)),
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Confirm',
                            style: TextStyle(
                              fontFamily: 'Alata',
                              fontSize: 13,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 22,
                          width: 74,
                          decoration:
                              const BoxDecoration(color: Color(0xffFF6E6E)),
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Alata',
                              fontSize: 13,
                              color: Color(0xff000000),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
