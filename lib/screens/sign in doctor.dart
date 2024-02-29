// ignore_for_file: use_build_context_synchronously, camel_case_types, unused_local_variable, file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/textformfield.dart';
import 'package:ihealth_monitor/helper/ShowSnackBar.dart';
import 'package:ihealth_monitor/screens/Home.dart';
import 'package:ihealth_monitor/screens/forget%20password.dart';
import 'package:ihealth_monitor/screens/sign%20up.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});
  static String id = 'signIn';

  @override
  State<signIn> createState() => _signUpState();
}

class _signUpState extends State<signIn> {
  bool isLoding = false;
  RegExp regexEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
          backgroundColor: const Color(0xffF0F0F0),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_sharp,
                              size: 33,
                            ),
                          ),
                        ],
                      ),
                      const Image(
                        image: AssetImage(
                            'assets/images/logo-removebg-preview.png'),
                        height: 210,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        'Doctor',
                        style: TextStyle(
                            fontFamily: 'Pacifico', fontSize: 30, height: .1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Sign in',
                    style: TextStyle(fontFamily: 'Artifika', fontSize: 40),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextForm(labelText: 'Email', mycontroller: email),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a Your Password';
                        }
                        return null;
                      },
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: 'Password'),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, forgetPassword.id);
                        },
                        child: const Text(
                          'Forget password?',
                          style: TextStyle(
                              fontFamily: 'alata',
                              fontSize: 14,
                              color: Color(0xff0C0094)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoding = true;
                          setState(() {});
                          try {
                            await signInUser();
                            Navigator.pushNamed(context, HomeDoctor.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'user not found',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            } else if (e.code == 'wrong-password') {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'wrong password',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            }
                          } catch (e) {
                            ShowSnackBar(context, 'Error');
                          }
                          isLoding = false;
                          setState(() {});
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff92B28F),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        height: 50,
                        width: 234,
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Sign in',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don`t have an account? ',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, signUp.id);
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            color: Color(0xff0C0094),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> signInUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }
}
