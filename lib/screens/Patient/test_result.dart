import 'package:flutter/material.dart';

class TestResults extends StatelessWidget {
  static String id = 'TestResults';
  const TestResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF0F0F0),
          title: const Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                'Test results',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    width: 310,
                    height: 500,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: const Color(0xffcedbcd),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/Test.jpg'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image(
                              image: AssetImage('assets/images/test 2.jpg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ));
  }
}
