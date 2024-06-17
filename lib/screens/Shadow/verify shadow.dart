import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/Oto.dart';
import 'package:ihealth_monitor/screens/Shadow/Forget%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/creat%20shadow.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerifyShadow extends StatefulWidget {
  const VerifyShadow({super.key});

  static String id = 'verifyPassword';

  @override
  State<VerifyShadow> createState() => _VerifyShadowState();
}

class _VerifyShadowState extends State<VerifyShadow> {
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
                        Navigator.pushNamed(context, ForgetShadow.id);
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
                    Navigator.pushNamed(context, CreatShadow.id);
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
