// // ignore_for_file: use_build_context_synchronously

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
import 'package:ihealth_monitor/screens/Patient/account_details_patients.dart';

class SettingsPatient extends StatefulWidget {
  const SettingsPatient({super.key});
  static String id = 'SettingsPatient';

  @override
  State<SettingsPatient> createState() => _SettingsPatientState();
}

class _SettingsPatientState extends State<SettingsPatient> {
  File? _image;
  int color = 0xffADC3C1;
  String fullName = '';

  @override
  void initState() {
    super.initState();
    fetchname();
    _loadImage();
  }

  Future<void> fetchname() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc(FirebaseAuth
              .instance.currentUser!.uid) // Use the correct document ID here
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          fullName = documentSnapshot['FullName'];
        });
      }
    } catch (e) {
      return;
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _saveImage(pickedFile.path);
    }
  }

  Future<void> _saveImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await prefs.setString('profile_image_$userId', imagePath);
  }

  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    String? imagePath = prefs.getString('profile_image_$userId');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _deleteImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await prefs.remove('profile_image_$userId');
    setState(() {
      _image = null;
    });
  }

  void _showImageOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Select a new image'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage();
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete current image'),
                onTap: () {
                  Navigator.of(context).pop();
                  _deleteImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC5C5C5),
      body: Center(
        child: ListView(
          children: [
            Container(
              height: 194,
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      SizedBox(width: 15),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Alata',
                          fontSize: 28,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: _showImageOptions,
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 216, 216, 216),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: const Color(0xffD9D9D9)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: _image != null
                                ? Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(
                                    Icons.add_a_photo,
                                    size: 35,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello',
                            style: TextStyle(
                              fontFamily: 'Alata',
                              fontSize: 20,
                              color: Color(0xff6B6B6B),
                            ),
                          ),
                          Text(
                            fullName,
                            style: const TextStyle(
                              fontFamily: 'Alata',
                              fontSize: 23,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Text(
                'Account',
                style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 20,
                  color: Color(0xff000000),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AccountDetailsPatient.id);
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 15),
                      Icon(
                        Icons.person,
                        color: Color(0xff17366F),
                        size: 35,
                      ),
                      Spacer(),
                      Text(
                        'Account details',
                        style: TextStyle(
                          fontFamily: 'Alata',
                          fontSize: 23,
                          color: Color(0xff000000),
                        ),
                      ),
                      Spacer(),
                      SizedBox(width: 60),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, signInPatient.id, (route) => false);
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 15),
                      Icon(
                        Icons.logout,
                        color: Color(0xff17366F),
                        size: 35,
                      ),
                      Spacer(),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: 'Alata',
                          fontSize: 23,
                          color: Color(0xff000000),
                        ),
                      ),
                      Spacer(),
                      SizedBox(width: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
// import 'package:ihealth_monitor/screens/Patient/account_details_patients.dart';

// class SettingsPatient extends StatefulWidget {
//   const SettingsPatient({super.key});
//   static String id = 'SettingsPatient';

//   @override
//   State<SettingsPatient> createState() => _SettingsPatientState();
// }

// class _SettingsPatientState extends State<SettingsPatient> {
  
//   int color = 0xffADC3C1;
//   String fullName = '';
//   Future<void> fetchname() async {
//     try {
//       DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//           .collection('Patients')
//           .doc(FirebaseAuth
//               .instance.currentUser!.uid) // Use the correct document ID here
//           .get();

//       if (documentSnapshot.exists) {
//         setState(() {
//           fullName = documentSnapshot['FullName'];
//         });
//       } else {}
//     } catch (e) {
//       return;
//     }
//   }

//   @override
//   void initState() {
//     fetchname();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffC5C5C5),
//       body: Center(
//         child: ListView(
//           children: [
//             Container(
//               width: 0,
//               height: 194,
//               decoration: BoxDecoration(
//                 color: Color(color),
//                 borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20)),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color(0x3f000000),
//                     offset: Offset(0, 4),
//                     blurRadius: 2,
//                   ),
//                   BoxShadow(
//                     color: Color(0x3f000000),
//                     offset: Offset(0, 4),
//                     blurRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Row(
//                     children: [
//                       SizedBox(
//                         width: 15,
//                       ),
//                       Text(
//                         'Settings',
//                         style: TextStyle(
//                           fontFamily: 'Alata',
//                           fontSize: 28,
//                           color: Color(0xff000000),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Container(
//                         height: 90,
//                         width: 90,
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 216, 216, 216),
//                             borderRadius: BorderRadius.circular(50),
//                             border: Border.all(color: const Color(0xffD9D9D9))),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(50),
//                           child: const Padding(
//                             padding: EdgeInsets.only(right: 5),
//                             child: Icon(
//                               Icons.add_a_photo,
//                               size: 35,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         children: [
//                           const Row(
//                             children: [
//                               Text(
//                                 'Hello',
//                                 style: TextStyle(
//                                   fontFamily: 'Alata',
//                                   fontSize: 20,
//                                   color: Color(0xff6B6B6B),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 145,
//                               )
//                             ],
//                           ),
//                           Text(
//                             fullName,
//                             style: const TextStyle(
//                               fontFamily: 'Alata',
//                               fontSize: 23,
//                               color: Color(0xff000000),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Row(
//               children: [
//                 SizedBox(
//                   width: 13,
//                 ),
//                 Text(
//                   'Account',
//                   style: TextStyle(
//                     fontFamily: 'Alata',
//                     fontSize: 20,
//                     color: Color(0xff000000),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Row(
//               children: [
//                 const SizedBox(
//                   width: 13,
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, AccountDetailsPatient.id);
//                     },
//                     child: Container(
//                       height: 70,
//                       width: 0,
//                       decoration: BoxDecoration(
//                           color: Color(color),
//                           borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               topRight: Radius.circular(20))),
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Icon(
//                             Icons.person,
//                             color: Color(0xff17366F),
//                             size: 35,
//                           ),
//                           Spacer(
//                             flex: 1,
//                           ),
//                           Text(
//                             'Account details',
//                             style: TextStyle(
//                               fontFamily: 'Alata',
//                               fontSize: 23,
//                               color: Color(0xff000000),
//                             ),
//                           ),
//                           Spacer(
//                             flex: 1,
//                           ),
//                           SizedBox(
//                             width: 60,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 13,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Row(
//               children: [
//                 const SizedBox(
//                   width: 13,
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () async {
//                       await FirebaseAuth.instance.signOut();
//                       Navigator.pushNamedAndRemoveUntil(
//                           context, signInPatient.id, (route) => false);
//                     },
//                     child: Container(
//                       height: 70,
//                       width: 0,
//                       decoration: BoxDecoration(
//                         color: Color(color),
//                         borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             bottomRight: Radius.circular(20)),
//                       ),
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Icon(
//                             Icons.logout,
//                             color: Color(0xff17366F),
//                             size: 35,
//                           ),
//                           Spacer(
//                             flex: 1,
//                           ),
//                           Text(
//                             'Logout',
//                             style: TextStyle(
//                               fontFamily: 'Alata',
//                               fontSize: 23,
//                               color: Color(0xff000000),
//                             ),
//                           ),
//                           Spacer(
//                             flex: 1,
//                           ),
//                           SizedBox(
//                             width: 50,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 13,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
