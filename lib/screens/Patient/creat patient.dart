// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
import 'package:ihealth_monitor/screens/Patient/verify%20patient.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20in%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/verify%20shadow.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class creatPatient extends StatefulWidget {
  const creatPatient({super.key});

  static String id = 'creatPatient';

  @override
  State<creatPatient> createState() => _creatPatientState();
}

class _creatPatientState extends State<creatPatient> {
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  RegExp regexPassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: const Color(0xffF0F0F0),
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, verifyPatient.id);
                        },
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          size: 33,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        'Create New Password',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Image(
                  image: AssetImage('assets/images/forgetPassword.png'),
                  height: 200,
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Your new password must be different from Previously Used Password.',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: SizedBox(
                    height: 65,
                    width: 320,
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your Password';
                        } else {
                          if (!regexPassword.hasMatch(value)) {
                            return 'Enter a valid password';
                          }
                          return null;
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'Password'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 65,
                    width: 320,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Confirm Password';
                        } else if (value != password.text) {
                          return 'Not match';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white70,
                        labelText: 'Confirm password',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        Navigator.pushNamed(context, signInPatient.id);
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff69B5AB),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 50,
                      width: 234,
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Save',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
