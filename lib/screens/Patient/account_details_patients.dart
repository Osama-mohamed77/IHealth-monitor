// ignore_for_file: file_names, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Patient/settings_patient.dart';

// ignore: camel_case_types
class AccountDetailsPatient extends StatefulWidget {
  const AccountDetailsPatient({super.key});
  static String id = 'AccountDetailsPatient';

  @override
  State<AccountDetailsPatient> createState() => _AccountDetailsPatientState();
}

class _AccountDetailsPatientState extends State<AccountDetailsPatient> {
  int color = 0xff69B5AB;
  String fullName = '';
  String userName = '';
  String email = '';
  String PhoneNumber = '';
  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc(FirebaseAuth
              .instance.currentUser!.uid) // Use the correct document ID here
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          fullName = documentSnapshot['FullName'];
          userName = documentSnapshot['userName'];
          email = documentSnapshot['email'];
          PhoneNumber = documentSnapshot['phoneNumber'];
        });
      } else {}
    } catch (e) {
      return;
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  TextEditingController fullNameController = TextEditingController();
  TextEditingController UserNameController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color),
        title: const Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text('Account details',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 30,
                  color: Colors.black,
                )),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffC5C5C5),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                        labelText: 'Full name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: fullName,
                        hintStyle: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: TextField(
                    controller: UserNameController,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: userName,
                        hintStyle: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: TextField(
                    controller: PhoneNumberController,
                    decoration: InputDecoration(
                        labelText: 'Phone number',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: PhoneNumber,
                        hintStyle: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        if (fullNameController.text != '') {
                          await updateFullname(
                              fullname: fullNameController.text);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Success',
                            btnOkOnPress: () {
                              Navigator.pushNamed(context, SettingsPatient.id);
                            },
                          ).show();
                        }
                        if (PhoneNumberController.text != '') {
                          await updatePhoneNumber(
                              phoneNumer: PhoneNumberController.text);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Success',
                            btnOkOnPress: () {
                              Navigator.pushNamed(context, SettingsPatient.id);
                            },
                          ).show();
                        }
                        if (UserNameController.text != '') {
                          await updateUsername(
                              userName: UserNameController.text);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Success',
                            btnOkOnPress: () {
                              Navigator.pushNamed(context, SettingsPatient.id);
                            },
                          ).show();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(color),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                          child: Text('SAVE',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'alata')),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> updateFullname({
  required String fullname,
}) async {
  await FirebaseFirestore.instance
      .collection('Patients')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
        'FullName': fullname,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> updatePhoneNumber({
  required String phoneNumer,
}) async {
  await FirebaseFirestore.instance
      .collection('Patients')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
        'phoneNumber': phoneNumer,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> updateUsername({
  required String userName,
}) async {
  await FirebaseFirestore.instance
      .collection('Patients')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
        'userName': userName,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
