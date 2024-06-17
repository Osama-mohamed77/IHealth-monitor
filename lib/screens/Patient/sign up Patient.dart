import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ihealth_monitor/helper/ShowSnackBar.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/Patient/Add%20address.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPatient extends StatefulWidget {
  const SignUpPatient({super.key});
  static String id = 'signUpPatient';

  @override
  State<SignUpPatient> createState() => _SignUpPatientState();
}

class _SignUpPatientState extends State<SignUpPatient> {
  bool isLoading = false;
  String dropdownValue = 'Male';
  RegExp regexPassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp regexEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static RegExp nameRegExp = RegExp('[a-zA-Z]');
  static RegExp numberRegExp = RegExp('[0-9]');
  static RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9]+$');
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phoneNumer = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController ConfairmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xffF0F0F0),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image(
                      image:
                          AssetImage('assets/images/logo-removebg-preview.png'),
                      height: 80,
                    ),
                    Text(
                      'Patient',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 20,
                        height: .5,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Artifika', fontSize: 40),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: fullName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Name';
                      }
                      if (!nameRegExp.hasMatch(value) ||
                          numberRegExp.hasMatch(value)) {
                        return 'Enter a Valid Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white70,
                      labelText: 'Full name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: userName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Username';
                      }
                      if (!usernameRegExp.hasMatch(value)) {
                        return 'Enter a Valid Username (letters and numbers only)';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white70,
                      labelText: 'Username',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: phoneNumer,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Phone Number';
                      } else if (value.length < 11 || value.length > 11) {
                        return 'Enter a Valid Phone Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white70,
                      labelText: 'Phone number',
                      suffixText: '+20',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 65,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]'),
                            ),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: age,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Age';
                            } else if (value.length > 2) {
                              return 'Enter a Valid Age';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.white70,
                            labelText: 'Age',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFBFBFB),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 93, 92, 92))),
                        height: 65,
                        width: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 20),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                              ),
                            ),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 73, 71, 71),
                                fontFamily: 'alata',
                                fontSize: 16),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'Male',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Female',
                                child: Text('Female'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Email';
                      } else if (!regexEmail.hasMatch(value)) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 65,
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
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 65,
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
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          MoreClass().signUpPatients(
                              email: email.text,
                              password: password.text,
                              fullname: fullName.text,
                              userName: userName.text,
                              age: age.text,
                              phoneNumer: phoneNumer.text,
                              gender: dropdownValue,
                              token: '');

                          Navigator.pushNamed(context, AddAddress.id);

                          // addUser();
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            ShowSnackBar(context, 'Weak password');
                          } else if (ex.code == 'email-already-in-use') {
                            ShowSnackBar(context, 'Email already exists');
                          }
                        } catch (ex) {
                          ShowSnackBar(context, 'There was an error');
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff69B5AB),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 50,
                      width: 234,
                      child: const Text(
                        'Sign up',
                        textAlign: TextAlign.center,
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign in',
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
        ),
      ),
    );
  }
}
