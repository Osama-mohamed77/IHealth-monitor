import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20in%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/verify%20shadow.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetShadow extends StatefulWidget {
  const ForgetShadow({super.key});
  static RegExp regexEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static String id = 'forgetPassword';

  @override
  State<ForgetShadow> createState() => _ForgetShadowState();
}

class _ForgetShadowState extends State<ForgetShadow> {
  GlobalKey<FormState> formKey = GlobalKey();
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
                          Navigator.pushNamed(context, SignInShadow.id);
                        },
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          size: 33,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      const Text(
                        'Forget password?',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 25,
                          color: Colors.black,
                        ),
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
                  'Enter your registered email to reset your password',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    height: 70,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Email';
                        } else if (!ForgetShadow.regexEmail.hasMatch(value)) {
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
                        Navigator.pushNamed(context, VerifyShadow.id);
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
                        'Send',
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
