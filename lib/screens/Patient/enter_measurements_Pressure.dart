
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gap/gap.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart'; // Adjust the import path as needed
import 'package:ihealth_monitor/helper/class.dart'; // Adjust the import path as needed

class EnterMeasurementsPressure extends StatefulWidget {
  const EnterMeasurementsPressure({Key? key}) : super(key: key);
  static const String id = 'EnterMeasurementsPressure';

  @override
  State<EnterMeasurementsPressure> createState() =>
      _EnterMeasurementsPressureState();
}

class _EnterMeasurementsPressureState extends State<EnterMeasurementsPressure> {
  TextEditingController measurementController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Pressure Measurement')
        .get();
    data.addAll(querySnapshot.docs);
    setState(() {});
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
      appBar: AppBar(
        backgroundColor: const Color(0xff69B5AB),
        title: const Text(
          'Pressure measurements',
          style: TextStyle(
            fontFamily: 'alata',
            fontSize: 23,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const Gap(100),
                const Text(
                  'Enter your measurement',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const Gap(40),
                Row(
                  children: [
                    const Gap(20),
                    Container(
                      height: 55,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '${data[index]['date measurements']}',
                          style: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        width: 150,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: measurementController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(7),
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                              if (newValue.text.isEmpty) {
                                return newValue;
                              }

                              // Remove any non-digit characters from the input
                              final cleaned = newValue.text
                                  .replaceAll(RegExp(r'[^0-9]'), '');

                              // Format the input as XX/YY or XXX/YY
                              if (cleaned.length > 2) {
                                final separatorIndex = cleaned.length - 2;
                                final formatted =
                                    '${cleaned.substring(0, separatorIndex)}/${cleaned.substring(separatorIndex)}';
                                return TextEditingValue(
                                  text: formatted,
                                  selection: TextSelection.collapsed(
                                      offset: formatted.length),
                                );
                              } else {
                                return TextEditingValue(
                                  text: cleaned,
                                  selection: TextSelection.collapsed(
                                      offset: cleaned.length),
                                );
                              }
                            }),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your measurement';
                            }

                            // Example validation for the format X/YY, XX/YY, or XXX/YY
                            final regex = RegExp(r'^\d{1,3}/\d{1,2}$');
                            if (!regex.hasMatch(value)) {
                              return 'Enter a valid measurement';
                            }

                            // Parse XXX/YY values
                            final parts = value.split('/');
                            final firstValue = int.parse(parts[0]);
                            final secondValue = int.parse(parts[1]);

                            // Check range constraints
                            if (firstValue < 50 ||
                                firstValue > 200 ||
                                secondValue < 30 ||
                                secondValue > 150) {
                              return '(50/30 - 200/150)';
                            }

                            return null;
                          },
                          style: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 20,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
                const Gap(40),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState != null &&
                        formKey.currentState!.validate()) {
                      // Validation passed, proceed with saving
                      await MoreClass().measurementPressure(
                        Measurement: measurementController.text,
                      );
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Success',
                        desc: 'The measurement has been saved',
                        btnOkOnPress: () {
                          Navigator.pushNamed(context, HomeNavBarPatient.id);
                        },
                      ).show();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xff69B5AB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
