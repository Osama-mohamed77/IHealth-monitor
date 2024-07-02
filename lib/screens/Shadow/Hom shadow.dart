import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Shadow/more_details.dart';

class HomeShadow extends StatefulWidget {
  const HomeShadow({super.key});
  static String id = 'HomeShadow';

  @override
  State<HomeShadow> createState() => _HomeShadowState();
}

class _HomeShadowState extends State<HomeShadow> {
  String username = '';
  List<Map<String, dynamic>> friends = [];

  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Shadow')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          username = documentSnapshot['userName'];
        });
      }

      // Fetch friends list
      QuerySnapshot friendDocs = await FirebaseFirestore.instance
          .collection('Users')
          .where('friends',
              arrayContains: FirebaseAuth.instance.currentUser!.uid)
          .get();

      setState(() {
        friends = friendDocs.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEF7E5),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xffA9A360)),
            height: 150,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Hi, $username',
                          style: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 30,
                            color: Colors.black,
                          )),
                      const Expanded(
                          child: SizedBox(
                        width: 0,
                      )),
                      const Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/Logo shadow.png'),
                            height: 60,
                          ),
                          Text(
                            'Shadow',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 20,
                              height: .9,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 22,
                      ),
                      Text('Ready to follow up on your patients!',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 15,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Display friends
          ...friends.map((friend) {
            String fullname = friend['fullname'] ?? 'Unknown';
            String age = friend['age'];
            String id = friend['id'];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoreDeteilsShadow(
                        patientId: id,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCFCCAE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0, 4),
                        blurRadius: 2,
                      ),
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0, 4),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        fullname,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        age,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      const Icon(
                        Icons.monitor_heart,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      const Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      const Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
