import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/Shadow/Home%20Nav%20Bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpShadow extends StatefulWidget {
  const SignUpShadow({super.key});
  static String id = 'signUpShadow';

  @override
  State<SignUpShadow> createState() => _SignUpShadowState();
}

class _SignUpShadowState extends State<SignUpShadow> {
  bool isLoading = false;
  String? usernameErrorMessage;

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
  TextEditingController phoneNumer = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future<bool> usernameExists(String userName) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('Users') // Query the 'Users' collection
          .where('userName', isEqualTo: userName)
          .get();
      return result.docs.isNotEmpty;
    } catch (e) {
      return false; // Handle or propagate the error as needed
    }
  }

  Future<void> addUser() async {
    try {
      await FirebaseFirestore.instance.collection('Users').add({
        'FullName': fullName.text,
        'userName': userName.text,
        'PhoneNumber': phoneNumer.text,
        'Email': email.text,
        'password': password.text,
      });
    } catch (error) {
      return;

    }
  }

  Future<void> handleSignUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final usernameUnique = await usernameExists(userName.text);
      if (usernameUnique) {
        setState(() {
          usernameErrorMessage =
              'Username already exists. Please choose a different one.';
        });
        setState(() {
          isLoading = false;
        });
        return;
      } else {
        setState(() {
          usernameErrorMessage = null;
        });
      }

      try {
        await MoreClass().signUpShadow(
          email: email.text,
          password: password.text,
          fullname: fullName.text,
          userName: userName.text,
          phoneNumer: phoneNumer.text,
        );

        await addUser();
        Navigator.pushNamed(context, HomeNavBarShadow.id);
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'weak-password') {
          usernameErrorMessage = 'Weak password';
        } else if (ex.code == 'email-already-in-use') {
          usernameErrorMessage = 'Email already exists';
        }
      } catch (ex) {
        usernameErrorMessage = 'There was an error';
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

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
                      'Shadow',
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
                    onChanged: (value) async {
                      if (value.isNotEmpty) {
                        final exists = await usernameExists(value);
                        setState(() {
                          usernameErrorMessage = exists
                              ? 'Username already exists. Please choose a different one.'
                              : null;
                        });
                      } else {
                        setState(() {
                          usernameErrorMessage = null;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white70,
                      labelText: 'Username',
                      errorText: usernameErrorMessage,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: phoneNumer,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Phone Number';
                      } else if (value.length != 11) {
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Password';
                      } else if (!regexPassword.hasMatch(value)) {
                        return 'Enter a valid password';
                      }
                      return null;
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
                const SizedBox(height: 20),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: confirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Confirm Password';
                      } else if (value != password.text) {
                        return 'Passwords do not match';
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
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: handleSignUp,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffA9A360),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 50,
                      width: 234,
                      child: const Center(
                        child: Text(
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
                ),
                const SizedBox(height: 20),
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
