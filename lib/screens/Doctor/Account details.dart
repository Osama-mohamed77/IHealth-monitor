import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});
  static String id = 'AccountDetails';

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  String fullName = '';
  String userName = '';
  String email = '';
  String PhoneNumber = '';

  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Doctors')
          .doc(FirebaseAuth
              .instance.currentUser!.uid) // Use the correct document ID here
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          fullName = documentSnapshot['FullName'];
          userName = documentSnapshot['userName'];
          email = documentSnapshot['email'];
          PhoneNumber = documentSnapshot['phoneNumber'];
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> updateFullname({required String fullname}) async {
    await FirebaseFirestore.instance
        .collection('Doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'FullName': fullname}).catchError((error) => null);
  }

  Future<void> updatePhoneNumber({required String phoneNumber}) async {
    await FirebaseFirestore.instance
        .collection('Doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'phoneNumber': phoneNumber}).catchError((error) => null);
  }

  Future<void> updateUsername({required String userName}) async {
    await FirebaseFirestore.instance
        .collection('Doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'userName': userName}).catchError((error) => null);

    // Optionally update username in 'Users' collection as well
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'userName': userName}).catchError((error) => null);
  }

  Future<bool> isUsernameUnique(String userName) async {
    // Check in the 'Doctors' collection
    final doctorsQuerySnapshot = await FirebaseFirestore.instance
        .collection('Doctors')
        .where('userName', isEqualTo: userName)
        .get();

    // Check in the 'Users' collection
    final usersQuerySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('userName', isEqualTo: userName)
        .get();

    // Returns true if the username is not found in both collections
    return doctorsQuerySnapshot.docs.isEmpty && usersQuerySnapshot.docs.isEmpty;
  }

  void _showErrorDialog(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      desc: message,
      btnOkOnPress: () {},
    ).show();
  }

  void _showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Success',
      btnOkOnPress: () {
        Navigator.pop(
            context); // Go back to the previous screen or any other desired action
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff92B28F),
        title: const Row(
          children: [
            Spacer(flex: 1),
            Text('Account details',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 30,
                  color: Colors.black,
                )),
            Spacer(flex: 2),
          ],
        ),
      ),
      backgroundColor: const Color(0xffC5C5C5),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(height: 70),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                        labelText: 'Full name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: fullName,
                        hintStyle: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: userName,
                        hintStyle: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                        labelText: 'Phone number',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: PhoneNumber,
                        hintStyle: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 30),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        bool hasError = false;
                        String errorMessage = '';

                        if (fullNameController.text.isNotEmpty) {
                          await updateFullname(
                              fullname: fullNameController.text);
                          _showSuccessDialog();
                        }

                        if (phoneNumberController.text.isNotEmpty) {
                          await updatePhoneNumber(
                              phoneNumber: phoneNumberController.text);
                          _showSuccessDialog();
                        }

                        if (userNameController.text.isNotEmpty) {
                          final newUserName = userNameController.text;
                          final isUnique = await isUsernameUnique(newUserName);
                          if (isUnique) {
                            await updateUsername(userName: newUserName);
                            _showSuccessDialog();
                          } else {
                            hasError = true;
                            errorMessage =
                                'Username already exists. Please choose a different one.';
                          }
                        }

                        if (hasError) {
                          _showErrorDialog(errorMessage);
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: const Color(0xff92B28F),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                          child: Text('SAVE',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'alata')),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
