import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ihealth_monitor/helper/ShowSnackBar.dart';

class AddPatientsShadow extends StatefulWidget {
  const AddPatientsShadow({Key? key}) : super(key: key);
  static String id = 'AddPatientsShadow';

  @override
  State<AddPatientsShadow> createState() => _AddPatientsShadowState();
}

class _AddPatientsShadowState extends State<AddPatientsShadow> {
  final TextEditingController _usernameController = TextEditingController();

  String username = '';
  String fullName = '';
  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Shadow')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          username = documentSnapshot['userName'];
          fullName = documentSnapshot['FullName'];
        });
      } else {}
    } catch (e) {
      return;
    }
  }

  Future<void> sendFriendRequest(String receiverUsername) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Fetch receiver's user document based on username
        QuerySnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .where('userName', isEqualTo: receiverUsername)
            .where('role', isEqualTo: 'patient')
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          DocumentSnapshot receiverDoc = userSnapshot.docs.first;
          String receiverId = receiverDoc.id;
          String receiverFullName = receiverDoc['fullname'] ?? 'No Name';
          String receiverAge = receiverDoc['age'] ?? 'Unknown';

          // Check if the receiver's role is 'patient'
          String receiverRole = receiverDoc['role'] ?? '';
          if (receiverRole == 'patient') {
            // Safely access and check the 'friends' field
            Map<String, dynamic>? receiverData =
                receiverDoc.data() as Map<String, dynamic>?;
            List<dynamic> friends =
                receiverData?['friends'] as List<dynamic>? ?? [];

            if (friends.contains(user.uid)) {
              // Notify user that they are already friends
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('You are already friends with $receiverUsername')),
              );
              return; // Exit the function early
            }

            // Check if a friend request already exists
            QuerySnapshot existingRequestSnapshot = await FirebaseFirestore
                .instance
                .collection('FriendRequests')
                .where('senderId', isEqualTo: user.uid)
                .where('receiverId', isEqualTo: receiverId)
                .where('status', isEqualTo: 'pending')
                .get();

            if (existingRequestSnapshot.docs.isEmpty) {
              // Send friend request
              await FirebaseFirestore.instance
                  .collection('FriendRequests')
                  .doc(receiverId) // Use a new document ID for each request
                  .set({
                'senderId': user.uid,
                'receiverId': receiverId,
                'receiverFullName': receiverFullName,
                'receiverAge': receiverAge,
                'status': 'pending',
                'SenderUserName': username,
                'senderName': fullName
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Friend request sent to $receiverUsername')),
              );
            } else {
              // Notify user that the request was already sent
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Friend request already sent to $receiverUsername')),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('User $receiverUsername is not a patient')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User not found')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending friend request: $e')),
      );
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
      appBar: AppBar(
        backgroundColor: const Color(0xffA9A360),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Add Patients',
            style: TextStyle(
              fontFamily: 'alata',
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 100),
          const Text(
            'Add your patients in IHealth monitor',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'alata',
              fontSize: 27,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'You will need both their username and a tag. Keep in \nmind that username is case sensitive',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'alata',
              fontSize: 13,
              color: Color(0xff8D8D8D),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(width: 30),
              Expanded(
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username000',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 30),
              Text(
                'Your username is $username',
                style: const TextStyle(
                  fontFamily: 'alata',
                  fontSize: 13,
                  color: Color(0xff8D8D8D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Center(
            child: GestureDetector(
              onTap: () {
                String receiverUsername = _usernameController.text.trim();
                if (username == receiverUsername) {
                  ShowSnackBar(context, 'Cannot send to this user');
                } else if (receiverUsername.isNotEmpty) {
                  sendFriendRequest(receiverUsername);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a username')),
                  );
                }
              },
              child: Container(
                width: 270,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xffA9A360),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Send Request',
                    style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
