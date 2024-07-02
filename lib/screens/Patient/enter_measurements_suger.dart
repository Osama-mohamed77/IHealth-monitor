import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart';
import 'package:intl/intl.dart';

class EnterMeasurementsSuger extends StatefulWidget {
  const EnterMeasurementsSuger({super.key});
  static String id = 'EnterMeasurementsSuger';

  @override
  State<EnterMeasurementsSuger> createState() => _EnterMeasurementsSugerState();
}

class _EnterMeasurementsSugerState extends State<EnterMeasurementsSuger> {
  TextEditingController firstMeasurement = TextEditingController();
  TextEditingController secondMeasurement = TextEditingController();
  int? _convertedFirstValue;
  int? _convertedSecondValue;
  final today = DateFormat('yyyy,M,d').format(DateTime.now());
  GlobalKey<FormState> firstFormKey = GlobalKey();
  GlobalKey<FormState> secondFormKey = GlobalKey();

  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Sugar Measurement')
        .get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  Future<void> AverageMeasurementSuger(
      {required int averageMeasurement}) async {
    await FirebaseFirestore.instance
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc(today.toString())
        .update({
      'Average': averageMeasurement,
    }).catchError((error) => null);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              AppBar(
                backgroundColor: const Color(0xff69B5AB),
                title: const Text(
                  'Sugar Measurements',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
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
                height: 30,
              ),

              // First measurement
              Form(
                key: firstFormKey,
                child: Column(
                  children: [
                    const Text('First measurement',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 40,
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
                            child: Center(
                              child: Text(
                                  '${data[index]['The first date for entering measurements']}',
                                  style: const TextStyle(
                                    fontFamily: 'alata',
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                            ),
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
                              controller: firstMeasurement,
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
                                final intValue = int.tryParse(value);
                                if (intValue == null ||
                                    intValue < 30 ||
                                    intValue > 300) {
                                  return 'Enter a valid measurement';
                                }
                                if (value.length > 3) {
                                  return 'Enter a valid measurement';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: const TextStyle(
                                fontFamily: 'alata',
                                fontSize: 20,
                                height: 1,
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
                      height: 30,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (firstFormKey.currentState!.validate()) {
                            _convertedFirstValue =
                                int.tryParse(firstMeasurement.text);
                            if (_convertedFirstValue != null) {
                              await MoreClass().firstMeasurementSuger(
                                  firstMeasurement: _convertedFirstValue!);
                              int? averageMeasurement;
                              if (_convertedSecondValue != null) {
                                averageMeasurement = (_convertedFirstValue! +
                                        _convertedSecondValue!) ~/
                                    2;
                              } else {
                                averageMeasurement = _convertedFirstValue;
                              }
                              AverageMeasurementSuger(
                                  averageMeasurement: averageMeasurement ?? 0);
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                title: 'Success',
                                desc: 'The measurement has been saved',
                                btnOkOnPress: () {
                                  Navigator.pushNamed(
                                      context, HomeNavBarPatient.id);
                                },
                              ).show();
                            }
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

              // Second measurement
              const SizedBox(
                height: 30,
              ),
              Form(
                key: secondFormKey,
                child: Column(
                  children: [
                    const Text('Second measurement',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 40,
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
                            child: Center(
                              child: Text(
                                  '${data[index]['The second date for entering measurements']}',
                                  style: const TextStyle(
                                    fontFamily: 'alata',
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                            ),
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
                              controller: secondMeasurement,
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
                                final intValue = int.tryParse(value);
                                if (intValue == null ||
                                    intValue < 30 ||
                                    intValue > 300) {
                                  return 'Enter a valid measurement';
                                }
                                if (value.length > 3) {
                                  return 'Enter a valid measurement';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: const TextStyle(
                                fontFamily: 'alata',
                                fontSize: 20,
                                height: 1,
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
                      height: 30,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (secondFormKey.currentState!.validate()) {
                            _convertedSecondValue =
                                int.tryParse(secondMeasurement.text);
                            if (_convertedSecondValue != null) {
                              int? averageMeasurement;
                              if (_convertedFirstValue != null) {
                                averageMeasurement = (_convertedFirstValue! +
                                        _convertedSecondValue!) ~/
                                    2;
                              } else {
                                averageMeasurement = _convertedSecondValue;
                              }
                              await MoreClass().secondMeasurementSuger(
                                  secondMeasurement: _convertedSecondValue!);
                              AverageMeasurementSuger(
                                  averageMeasurement: averageMeasurement ?? 0);
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                title: 'Success',
                                desc: 'The measurement has been saved',
                                btnOkOnPress: () {
                                  Navigator.pushNamed(
                                      context, HomeNavBarPatient.id);
                                },
                              ).show();
                            }
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
            ],
          );
        },
      ),
    );
  }
}
