import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/textformfield.dart';
import 'package:ihealth_monitor/helper/ShowSnackBar.dart';
import 'package:ihealth_monitor/screens/Shadow/Forget%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Home%20Nav%20Bar.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20up%20shadow.dart';
import 'package:ihealth_monitor/screens/choose%20screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInShadow extends StatefulWidget {
  const SignInShadow({super.key});
  static String id = 'signInShadow';

  @override
  State<SignInShadow> createState() => _SignUpState();
}

class _SignUpState extends State<SignInShadow> {
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
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ChooseScreen.id);
                          },
                          child: const Icon(
                            Icons.arrow_back_sharp,
                            size: 33,
                          ),
                        ),
                      ],
                    ),
                    const Image(
                      image:
                          AssetImage('assets/images/logo-removebg-preview.png'),
                      height: 210,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Shadow',
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
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 65,
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
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ForgetShadow.id);
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
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'user not found',
                              btnOkOnPress: () {},
                            ).show();
                          } else if (e.code == 'wrong-password') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'wrong password',
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
                        color: Color(0xffA9A360),
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
                        Navigator.pushNamed(context, SignUpShadow.id);
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
          )),
    );
  }

  Future<void> signInUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      User? user = userCredential.user;
      if (user != null) {
        String userId = user.uid;

        // Fetch the user's role from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .get();
        String? role = userDoc['role'];

        // Check if role is set
        if (role == null || role.isEmpty) {
          await FirebaseAuth.instance.signOut();
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Sign-in Error',
            desc: 'Your role is not set. Please contact support.',
            btnOkOnPress: () {},
          ).show();
        } else {
          // Navigate based on role
          if (role == 'patient') {
            ShowSnackBar(
                context, 'This account is for the patient application');
          } else if (role == 'doctor') {
            ShowSnackBar(context, 'This account is for the doctor application');
          } else if (role == 'shadow') {
            Navigator.pushReplacementNamed(context, HomeNavBarShadow.id);
          } else {
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Sign-in Error',
          desc: 'User not found. Please check your email address.',
          btnOkOnPress: () {},
        ).show();
      } else if (e.code == 'wrong-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Sign-in Error',
          desc: 'Wrong password. Please check your password and try again.',
          btnOkOnPress: () {},
        ).show();
      } else {
        ShowSnackBar(context, 'Error: ${e.message}');
      }
    } catch (e) {
      // Handle other errors
      ShowSnackBar(context, 'Sign-in failed. Please try again later.');
    }
  }
}
