// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/Oto.dart';
import 'package:ihealth_monitor/screens/Patient/Forget%20patient.dart';
import 'package:ihealth_monitor/screens/Patient/creat%20patient.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class verifyPatient extends StatefulWidget {
  const verifyPatient({super.key});

  static String id = 'verifyPatient';

  @override
  State<verifyPatient> createState() => _verifyPatientState();
}

class _verifyPatientState extends State<verifyPatient> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, forgetPatient.id);
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
                      'Verify your email',
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
                image: AssetImage('assets/images/Verify.png'),
                height: 200,
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Please enter the 4 digit code ',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  OtpForm(),
                  OtpForm(),
                  OtpForm(),
                  OtpForm(),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                    }
                    Navigator.pushNamed(context, creatPatient.id);
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
                      'Verify',
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
        ),
      ),
    );
  }
}
