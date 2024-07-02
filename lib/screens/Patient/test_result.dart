import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class TestResults extends StatefulWidget {
  static String id = 'TestResults';
  const TestResults({super.key});

  @override
  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {
  bool isLoading = true;
  String imageUrl = '';

  Future<void> fetchImage() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients list')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          imageUrl = documentSnapshot['imageUrl'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xff69B5AB),
            title: const Row(
              children: [
                Spacer(flex: 1),
                Text(
                  'Test results',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
          body: Center(
            child: Column(
              children: [
               
                const SizedBox(height: 100),
                if (imageUrl != '')
                
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          width: 310,
                          height: 320,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: const Color(0xffFFFEFB),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(imageUrl),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                if (imageUrl == '') Image.asset('assets/images/gif test.gif')
              ],
            ),
          ),
        ));
  }
}
