import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart';

class EnterMeasurementsPressure extends StatefulWidget {
  const EnterMeasurementsPressure({super.key});
  static String id = 'EnterMeasurementsPressure';

  @override
  State<EnterMeasurementsPressure> createState() =>
      _EnterMeasurementsPressureState();
}

class _EnterMeasurementsPressureState extends State<EnterMeasurementsPressure> {
  TextEditingController firstMeasurement = TextEditingController();
  TextEditingController secondMeasurement = TextEditingController();

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
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: const Color(0xffF0F0F0),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(children: [
              AppBar(
                backgroundColor: const Color(0xffF0F0F0),
                title: const Text(
                  'Enter measurements',
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
                      const Text('Pressure measurements',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 23,
                            color: Colors.black,
                          )),
                      Container(
                        height: 2,
                        width: 250,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Enter your measurement',
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
                        child: Text('${data[index]['date measurements']}',
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
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (firstMeasurement.text.isNotEmpty) {
                      await MoreClass().measurementPressure(
                          firstMeasurement: firstMeasurement.text);
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
                    } else {}
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
              )
            ]);
          },
        ),
      ),
    );
  }
}




























  // body: ListView(
        //   children: [
        //     Container(
        //       decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.only(
        //               bottomLeft: Radius.circular(30),
        //               bottomRight: Radius.circular(30)),
        //           color: Color(0xff69B5AB)),
        //       height: 74,
        //       width: 360,
        //       child: const Padding(
        //         padding: EdgeInsets.only(top: 10),
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 Spacer(
        //                   flex: 1,
        //                 ),
        //                 Text('Enter measurements',
        //                     style: TextStyle(
        //                       fontFamily: 'alata',
        //                       fontSize: 25,
        //                       color: Colors.black,
        //                     )),
        //                 Expanded(
        //                     child: SizedBox(
        //                   width: 0,
        //                 )),
        //                 Column(
        //                   children: [
        //                     Image(
        //                       image:
        //                           AssetImage('assets/images/logo-pateint.png'),
        //                       height: 40,
        //                     ),
        //                     Text(
        //                       'Patient',
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(
        //                         fontFamily: 'Pacifico',
        //                         fontSize: 15,
        //                         height: .9,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   width: 20,
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 50,
        //     ),
        //     Row(
        //       children: [
        //         const SizedBox(
        //           width: 15,
        //         ),
        //         Column(
        //           children: [
        //             const Text('Sugar measurements',
        //                 style: TextStyle(
        //                   fontFamily: 'alata',
        //                   fontSize: 23,
        //                   color: Colors.black,
        //                 )),
        //             Container(
        //               height: 2,
        //               width: 225,
        //               color: Colors.black,
        //             )
        //           ],
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 40,
        //     ),
        //     const Padding(
        //       padding: EdgeInsets.only(left: 15),
        //       child: Text('First measurement',
        //           style: TextStyle(
        //             fontFamily: 'alata',
        //             fontSize: 18,
        //             color: Colors.black,
        //           )),
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     const SizedBox(
        //       width: 30,
        //     ),
            
        //     const SizedBox(
        //       width: 20,
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         height: 60,
        //         width: 150,
        //         child: TextFormField(
        //           controller: firstMeasurement,
        //           keyboardType: TextInputType.number,
        //           inputFormatters: <TextInputFormatter>[
        //             FilteringTextInputFormatter.allow(
        //               RegExp(r'[0-9]'),
        //             ),
        //             FilteringTextInputFormatter.digitsOnly
        //           ],
        //           validator: (value) {
        //             if (value!.isEmpty) {
        //               return 'Enter your measurement';
        //             }
            
        //             return null;
        //           },
        //           decoration: InputDecoration(
        //               border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(10)),
        //               filled: true,
        //               fillColor: Colors.white),
        //           style: const TextStyle(
        //               fontFamily: 'alata', fontSize: 20, height: 1),
        //         ),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 30,
        //     ),
        //     const SizedBox(
        //       height: 50,
        //     ),
        //     Center(
        //       child: GestureDetector(
        //         onTap: () {
        //           MoreClass().addFirstMeasurement(
        //               firstMeasurement: firstMeasurement.text);
        //           Navigator.pushNamed(context, HomePatients.id);
        //         },
        //         child: Container(
        //           height: 50,
        //           width: 150,
        //           decoration: BoxDecoration(
        //               color: const Color(0xff69B5AB),
        //               borderRadius: BorderRadius.circular(10)),
        //           child: const Center(
        //             child: Text('Save',
        //                 style: TextStyle(
        //                   fontFamily: 'alata',
        //                   fontSize: 25,
        //                   color: Colors.black,
        //                 )),
        //           ),
        //         ),
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 40,
        //     ),
        //     const Padding(
        //       padding: EdgeInsets.only(left: 15),
        //       child: Text('Second measurement',
        //           style: TextStyle(
        //             fontFamily: 'alata',
        //             fontSize: 18,
        //             color: Colors.black,
        //           )),
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     Row(
        //       children: [
        //         const SizedBox(
        //           width: 30,
        //         ),
        //         Expanded(
        //           child: Container(
        //             height: 60,
        //             width: 120,
        //             decoration: BoxDecoration(
        //                 border: Border.all(),
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: Colors.white),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 20,
        //         ),
        //         Expanded(
        //           child: SizedBox(
        //             height: 60,
        //             width: 150,
        //             child: TextFormField(
        //               controller: secondMeasurement,
        //               keyboardType: TextInputType.number,
        //               inputFormatters: <TextInputFormatter>[
        //                 FilteringTextInputFormatter.allow(
        //                   RegExp(r'[0-9]'),
        //                 ),
        //                 FilteringTextInputFormatter.digitsOnly
        //               ],
        //               validator: (value) {
        //                 if (value!.isEmpty) {
        //                   return 'Enter your measurement';
        //                 }

        //                 return null;
        //               },
        //               decoration: InputDecoration(
        //                   border: OutlineInputBorder(
        //                       borderRadius: BorderRadius.circular(10)),
        //                   filled: true,
        //                   fillColor: Colors.white),
        //               style: const TextStyle(
        //                   fontFamily: 'alata', fontSize: 20, height: 1),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 30,
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 50,
        //     ),
        //     Center(
        //       child: GestureDetector(
        //         onTap: () {
        //           MoreClass().addSecondMeasurement(
        //               secondMeasurement: secondMeasurement.text);
        //           Navigator.pushNamed(context, HomePatients.id);
        //         },
        //         child: Container(
        //           height: 50,
        //           width: 150,
        //           decoration: BoxDecoration(
        //               color: const Color(0xff69B5AB),
        //               borderRadius: BorderRadius.circular(10)),
        //           child: const Center(
        //             child: Text('Save',
        //                 style: TextStyle(
        //                   fontFamily: 'alata',
        //                   fontSize: 25,
        //                   color: Colors.black,
        //                 )),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),