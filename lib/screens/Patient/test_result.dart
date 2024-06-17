import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestResults extends StatefulWidget {
  static String id = 'TestResults';
  const TestResults({super.key});

  @override
  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {
  String imageUrl = '';
  bool isLoading = true;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF0F0F0),
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
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: const Color(0xffcedbcd),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                isLoading
                                    ? const CircularProgressIndicator()
                                    : imageUrl.isNotEmpty
                                        ? Image.network(imageUrl)
                                        : const Text('No image available'),
                                const SizedBox(height: 10),
                                isLoading
                                    ? const CircularProgressIndicator()
                                    : imageUrl.isNotEmpty
                                        ? Image.network(imageUrl)
                                        : const Text('No image available'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
