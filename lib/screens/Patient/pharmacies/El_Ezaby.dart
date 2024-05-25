// ignore_for_file: file_names, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/Patient/patient_const.dart';

class ElEzaby extends StatefulWidget {
  static String id = 'ElEzaby';
  const ElEzaby({super.key});

  @override
  State<ElEzaby> createState() => _ElEzabyState();
}

class _ElEzabyState extends State<ElEzaby> {
  String pharmacyName = 'el ezaby pharmacy';
  TimeOfDay _selectTime = const TimeOfDay(hour: 00, minute: 00);
  GlobalKey<FormState> formKey = GlobalKey();
  _ShowTimePickerFirst() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _selectTime = value!;
      });
    }).onError((error, stackTrace) => null);
  }

  String TypeDevice = 'The type is not specified';
  Blood() async {
    setState(() {
      TypeDevice = 'Blood pressure monitor';
    });
  }

  Suger() async {
    setState(() {
      TypeDevice = 'Sugar glucose monitor';
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Text('Measuring devices'),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Image.asset(
                      'assets/images/ezapy.png',
                      height: 87,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Center(
                  child: Text(
                    'el ezaby pharmacy',
                    style: TextStyle(fontFamily: 'alata', fontSize: 25),
                  ),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                Container(
                  height: 130,
                  width: 500,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                        leading: Image.asset(
                          'assets/images/blood.jpg',
                          width: 100,
                          height: 80,
                        ),
                        title: const Text(
                          'Blood pressure monitor',
                          style: TextStyle(fontFamily: 'alata', fontSize: 19),
                        ),
                        subtitle: const Row(
                          children: [
                            Text(
                              'Service price: ',
                              style:
                                  TextStyle(fontFamily: 'alata', fontSize: 15),
                            ),
                            Text(
                              '40EGP ',
                              style: TextStyle(
                                  fontFamily: 'alata',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _ShowTimePickerFirst();

                            Blood();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: const Color(0xff69B5AB),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Text(
                                'Select',
                                style: TextStyle(
                                    fontFamily: 'alata', fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 130,
                  width: 500,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                        leading: Image.asset(
                          'assets/images/suger.jpg',
                          width: 100,
                          height: 80,
                        ),
                        title: const Text(
                          'Sugar glucose monitor',
                          style: TextStyle(fontFamily: 'alata', fontSize: 19),
                        ),
                        subtitle: const Row(
                          children: [
                            Text(
                              'Service price: ',
                              style:
                                  TextStyle(fontFamily: 'alata', fontSize: 15),
                            ),
                            Text(
                              '40EGP ',
                              style: TextStyle(
                                  fontFamily: 'alata',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _ShowTimePickerFirst();

                            Suger();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: const Color(0xff69B5AB),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Text(
                                'Select',
                                style: TextStyle(
                                    fontFamily: 'alata', fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 17,
                ),
                const Text(
                  'Device type:',
                  style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  TypeDevice,
                  style: const TextStyle(
                      color: Color(0xff69B5AB),
                      fontFamily: 'alata',
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 17,
                ),
                const Text(
                  'Order time:',
                  style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  _selectTime.format(context),
                  style: const TextStyle(
                      color: Color(0xff69B5AB),
                      fontFamily: 'alata',
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      MoreClass().orderDevice(
                          pharmacyName: pharmacyName,
                          fullname: PatientConst.name,
                          age: PatientConst.age,
                          email: PatientConst.email,
                          phoneNumber: PatientConst.phoneNumber,
                          userName: PatientConst.userName,
                          gender: PatientConst.gender,
                          area: AddressConst.Area,
                          apartmentNumber: AddressConst.ApartmentNumber,
                          floorNumber: AddressConst.FloorNumber,
                          streetName: AddressConst.StreetName,
                          landlineNumber: AddressConst.LandlineNumber,
                          buildingName: AddressConst.BuildingName,
                          date: _selectTime.format(context),
                          deviceType: TypeDevice);
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          border: Border.all(),
                          color: const Color(0xff69B5AB),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          'Request',
                          style: TextStyle(fontFamily: 'alata', fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Text(
                  'Set a delivery date for your order and don\'t forget \n                              the delivery time.',
                  style: TextStyle(
                      color: Color.fromARGB(255, 91, 90, 90),
                      fontFamily: 'alata',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
