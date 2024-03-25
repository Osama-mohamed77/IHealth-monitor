// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';

// ignore: camel_case_types
class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});
  static String id = 'AccountDetails';

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC5C5C5),
      body: Center(
        child: ListView(
          children: [
            Container(
              width: 0,
              height: 240,
              decoration: const BoxDecoration(
                color: Color(0xffA7B3A6),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 7,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 216, 216, 216),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: const Color(0xffD9D9D9))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.add_a_photo,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            profile('Full name', 'osama mohamed'),
            profile('Username', 'Osama77'),
            profile('Email', 'osama123@gmail.com'),
            profile('Phone number', '01146869968'),
            const SizedBox(
              width: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text('CANCEL',
                        style: TextStyle(fontSize: 15, fontFamily: 'alata')),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color(0xff92B28F),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text('SAVE',
                        style: TextStyle(fontSize: 15, fontFamily: 'alata')),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget profile(String labelText, String placeholder) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 300,
        child: TextField(
          decoration: InputDecoration(
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: const TextStyle(
                  fontFamily: 'alata',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ),
    );
  }
}
