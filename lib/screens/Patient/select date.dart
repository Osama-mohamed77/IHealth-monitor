// ignore_for_file: use_build_context_synchronously, file_names, prefer_final_fields, unused_field, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/Patient/Enter%20measurements.dart';
import 'package:ihealth_monitor/screens/Patient/Measuring%20devices.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});
  static String id = 'SelectDate';

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  int _page = 0;
  bool isLoading = false;
  TimeOfDay _FirstTimeOfDay = const TimeOfDay(hour: 00, minute: 00);
  _ShowTimePickerFirst() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _FirstTimeOfDay = value!;
      });
    });
  }

  TimeOfDay _SecondTimeOfDay = const TimeOfDay(hour: 00, minute: 00);
  _ShowTimePickerSecond() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _SecondTimeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
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
              height: 90,
            ),
            const Center(
              child:
                  Text('Enter the dates for entering \n          measurements',
                      style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: 23,
                        color: Colors.black,
                      )),
            ),
            const SizedBox(
              height: 90,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text('First measurement',
                    style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 17,
                      color: Colors.black,
                    )),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: _ShowTimePickerFirst,
                  child: Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 7,
                        ),
                        Text(_FirstTimeOfDay.format(context).toString(),
                            style: const TextStyle(
                              fontFamily: 'alata',
                              fontSize: 15,
                              color: Colors.black,
                            )),
                        const Spacer(
                          flex: 1,
                        ),
                        const Icon(
                          Icons.timer,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Text('Second measurement',
                    style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 17,
                      color: Colors.black,
                    )),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: _ShowTimePickerSecond,
                  child: Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 7,
                        ),
                        Text(_SecondTimeOfDay.format(context).toString(),
                            style: const TextStyle(
                              fontFamily: 'alata',
                              fontSize: 15,
                              color: Colors.black,
                            )),
                        const Spacer(
                          flex: 1,
                        ),
                        const Icon(
                          Icons.timer,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    await MoreClass().firstDatesMeasurement(
                        firstTime: _FirstTimeOfDay.format(context).toString(),
                        secondTime:
                            _SecondTimeOfDay.format(context).toString());

                    Navigator.pushNamed(context, EnterMeasurements.id);
                    isLoading = false;
                    setState(() {});
                  },
                  child: Expanded(
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
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
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, EnterMeasurements.id);
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                          border: Border.all(),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text('Skip',
                            style: TextStyle(
                              fontFamily: 'alata',
                              fontSize: 25,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
