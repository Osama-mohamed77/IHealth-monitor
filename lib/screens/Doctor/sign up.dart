import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:ihealth_monitor/screens/Doctor/HomeNav_Bar.dart';
import 'package:ihealth_monitor/helper/ShowSnackBar.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static String id = 'signUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  bool isUsernameTaken = false;
  bool isCheckingUsername = false;
  String? selectedClinic;

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

  DatabaseReference ClinicsRef =
      FirebaseDatabase.instance.ref().child('contact');

  Future<void> handleSignUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final usernameUnique = await MoreClass().usernameExists(userName.text);
      if (usernameUnique) {
        ShowSnackBar(context, 'Username already taken');
        setState(() {
          isLoading = false;
        });
        return;
      } else {
        setState(() {
          isUsernameTaken = false;
        });
      }

      try {
        await MoreClass().signUpDoctor(
          email: email.text,
          password: password.text,
          fullname: fullName.text,
          userName: userName.text,
          phoneNumer: phoneNumer.text,
          clinicName: selectedClinic!,
        );

        Navigator.pushNamed(context, HomeNavBarDoctor.id);
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'weak-password') {
          ShowSnackBar(context, 'Weak password');
        } else if (ex.code == 'email-already-in-use') {
          ShowSnackBar(context, 'Email already exists');
        }
      } catch (ex) {
        ShowSnackBar(context, 'There was an error');
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
                      'Doctor',
                      textAlign: TextAlign.center,
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
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                      if (isUsernameTaken) {
                        return 'Username already taken';
                      }
                      return null;
                    },
                    onChanged: (value) async {
                      if (value.isNotEmpty && usernameRegExp.hasMatch(value)) {
                        setState(() {
                          isCheckingUsername = true;
                        });
                        bool usernameTaken =
                            await MoreClass().usernameExists(value);
                        setState(() {
                          isUsernameTaken = usernameTaken;
                          isCheckingUsername = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      labelText: 'Username',
                      suffixIcon: isCheckingUsername
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : null,
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
                      FilteringTextInputFormatter.digitsOnly,
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
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      labelText: 'Email',
                    ),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      labelText: 'Password',
                    ),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      labelText: 'Confirm password',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                StreamBuilder<DatabaseEvent>(
                  stream: ClinicsRef.onValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData ||
                        snapshot.data!.snapshot.value == null) {
                      return const Center(child: Text('No clinics available'));
                    }

                    // Extract clinic names from snapshot data
                    final data = snapshot.data!.snapshot.value as Map?;
                    Set<String> clinicNames = {};

                    if (data != null) {
                      data.forEach((key, value) {
                        // Debug print statement
                        if (value is Map &&
                            value.containsKey('name') &&
                            value['name'] is String &&
                            value.containsKey('type') &&
                            value['type'] == 'Clinic') {
                          clinicNames.add(value['name'] as String);
                        }
                      });
                    }

                    List<String> clinicNamesList = clinicNames.toList();
                    // Debug print statement

                    // Ensure that selectedClinic is in clinicNamesList
                    if (selectedClinic != null &&
                        !clinicNamesList.contains(selectedClinic)) {
                      selectedClinic =
                          null; // Reset selectedClinic if it is no longer valid
                    }

                    return DropdownButtonFormField<String>(
                      value: selectedClinic,
                      hint: const Text('Select Clinic'),
                      items: clinicNamesList.map((clinicName) {
                        return DropdownMenuItem<String>(
                          value: clinicName,
                          child: Text(clinicName),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedClinic = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                    );
                  },
                ),
                const Gap(30),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate() ||
                          selectedClinic != null) {
                        isLoading = true;
                        setState(() {});
                        try {
                          bool usernameTaken =
                              await MoreClass().usernameExists(userName.text);
                          if (usernameTaken) {
                            ShowSnackBar(context, 'Username already taken');
                          } else {
                            await MoreClass().signUpDoctor(
                              email: email.text,
                              password: password.text,
                              fullname: fullName.text,
                              userName: userName.text,
                              phoneNumer: phoneNumer.text,
                              clinicName: selectedClinic!,
                            );
                            Navigator.pushNamed(context, HomeNavBarDoctor.id);
                          }
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
                        color: Color(0xff92B28F),
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
                const Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}













// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ihealth_monitor/screens/Doctor/HomeNav_Bar.dart';
// import 'package:ihealth_monitor/helper/ShowSnackBar.dart';
// import 'package:ihealth_monitor/helper/class.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//   static String id = 'signUp';

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   bool isLoading = false;
//   bool isUsernameTaken = false;
//   bool isCheckingUsername = false;

//   RegExp regexPassword =
//       RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
//   RegExp regexEmail = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

//   static RegExp nameRegExp = RegExp('[a-zA-Z]');
//   static RegExp numberRegExp = RegExp('[0-9]');
//   static RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9]+$');
//   GlobalKey<FormState> formKey = GlobalKey();
//   TextEditingController fullName = TextEditingController();
//   TextEditingController userName = TextEditingController();
//   TextEditingController PhoneNumer = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController ConfairmPassword = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: isLoading,
//       child: Scaffold(
//         backgroundColor: const Color(0xffF0F0F0),
//         body: Form(
//           key: formKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: ListView(
//               children: [
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Image(
//                       image:
//                           AssetImage('assets/images/logo-removebg-preview.png'),
//                       height: 80,
//                     ),
//                     Text(
//                       'Doctor',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Pacifico',
//                         fontSize: 20,
//                         height: .5,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Text(
//                   'Sign up',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontFamily: 'Artifika', fontSize: 40),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 65,
//                   child: TextFormField(
//                     controller: fullName,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter Your Name';
//                       }
//                       if (!nameRegExp.hasMatch(value) ||
//                           numberRegExp.hasMatch(value)) {
//                         return 'Enter a Valid Name';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white70,
//                       labelText: 'Full name',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 65,
//                   child: TextFormField(
//                     controller: userName,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter Your Username';
//                       }
//                       if (!usernameRegExp.hasMatch(value)) {
//                         return 'Enter a Valid Username (letters and numbers only)';
//                       }
//                       if (isUsernameTaken) {
//                         return 'Username already taken';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) async {
//                       if (value.isNotEmpty && usernameRegExp.hasMatch(value)) {
//                         setState(() {
//                           isCheckingUsername = true;
//                         });
//                         bool usernameTaken =
//                             await MoreClass().usernameExists(value);
//                         setState(() {
//                           isUsernameTaken = usernameTaken;
//                           isCheckingUsername = false;
//                         });
//                       }
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white70,
//                       labelText: 'Username',
//                       suffixIcon: isCheckingUsername
//                           ? Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: CircularProgressIndicator(strokeWidth: 2),
//                             )
//                           : null,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 65,
//                   child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     inputFormatters: <TextInputFormatter>[
//                       FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     controller: PhoneNumer,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter Your Phone Number';
//                       } else if (value.length < 11 || value.length > 11) {
//                         return 'Enter a Valid Phone Number';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white70,
//                       labelText: 'Phone number',
//                       suffixText: '+20',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 65,
//                   child: TextFormField(
//                     controller: email,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter Your Email';
//                       } else if (!regexEmail.hasMatch(value)) {
//                         return 'Enter a valid Email';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white70,
//                       labelText: 'Email',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 65,
//                   child: TextFormField(
//                     controller: password,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter your Password';
//                       } else {
//                         if (!regexPassword.hasMatch(value)) {
//                           return 'Enter a valid password';
//                         }
//                         return null;
//                       }
//                     },
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white70,
//                       labelText: 'Password',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const SizedBox(
//                   width: 33,
//                 ),
//                 SizedBox(
//                   height: 65,
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter Your Confirm Password';
//                       } else if (value != password.text) {
//                         return 'Not match';
//                       }
//                       return null;
//                     },
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white70,
//                       labelText: 'Confirm password',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Center(
//                   child: GestureDetector(
//                     onTap: () async {
//                       if (formKey.currentState!.validate()) {
//                         isLoading = true;
//                         setState(() {});
//                         try {
//                           bool usernameTaken =
//                               await MoreClass().usernameExists(userName.text);
//                           if (usernameTaken) {
//                             ShowSnackBar(context, 'Username already taken');
//                           } else {
//                             await MoreClass().signUpDoctor(
//                               email: email.text,
//                               password: password.text,
//                               fullname: fullName.text,
//                               userName: userName.text,
//                               phoneNumer: PhoneNumer.text,
//                             );
//                             Navigator.pushNamed(context, HomeNavBarDoctor.id);
//                           }
//                         } on FirebaseAuthException catch (ex) {
//                           if (ex.code == 'weak-password') {
//                             ShowSnackBar(context, 'Weak password');
//                           } else if (ex.code == 'email-already-in-use') {
//                             ShowSnackBar(context, 'Email already exists');
//                           }
//                         } catch (ex) {
//                           ShowSnackBar(context, 'There was an error');
//                         }
//                         isLoading = false;
//                         setState(() {});
//                       }
//                     },
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Color(0xff92B28F),
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       height: 50,
//                       width: 234,
//                       child: const Text(
//                         'Sign up',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'alata',
//                           fontSize: 32,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Already have an account? ',
//                       style: TextStyle(
//                         fontFamily: 'alata',
//                         fontSize: 14,
//                         color: Colors.black,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         'Sign in',
//                         style: TextStyle(
//                           fontFamily: 'alata',
//                           fontSize: 16,
//                           color: Color(0xff0C0094),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

