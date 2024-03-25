// ignore_for_file: use_build_context_synchronously, file_names, prefer_final_fields, unused_field, non_constant_identifier_names, unused_element, unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ihealth_monitor/screens/Patient/select%20date.dart';

class EnterMeasurements extends StatefulWidget {
  const EnterMeasurements({super.key});
  static String id = 'EnterMeasurements';

  @override
  State<EnterMeasurements> createState() => _EnterMeasurementsState();
}

class _EnterMeasurementsState extends State<EnterMeasurements> {
  int _page = 0;
  TextEditingController second = TextEditingController();
  TextEditingController first = TextEditingController();
  static RegExp numberRegExp = RegExp('[50-200]');
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: const Color(0xffF0F0F0),
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Color(0xff69B5AB)),
              height: 74,
              width: 360,
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Text('Enter measurements',
                            style: TextStyle(
                              fontFamily: 'alata',
                              fontSize: 25,
                              color: Colors.black,
                            )),
                        Expanded(
                            child: SizedBox(
                          width: 0,
                        )),
                        Column(
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/images/logo-pateint.png'),
                              height: 40,
                            ),
                            Text(
                              'Patient',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 15,
                                height: .9,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    const Text('Sugar measurements',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 23,
                          color: Colors.black,
                        )),
                    Container(
                      height: 2,
                      width: 225,
                      color: Colors.black,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text('First measurement',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 18,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    width: 150,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]'),
                        ),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your measurement';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white),
                      style: const TextStyle(
                          fontFamily: 'alata', fontSize: 20, height: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: const Color(0xff69B5AB),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text('Save',
                      style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: 25,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text('Second measurement',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 18,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    width: 150,
                    child: TextFormField(
                      controller: second,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[50-200]'),
                        ),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your measurement';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white),
                      style: const TextStyle(
                          fontFamily: 'alata', fontSize: 20, height: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, SelectDate.id);
                  }
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color(0xff69B5AB),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('Save',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 25,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
