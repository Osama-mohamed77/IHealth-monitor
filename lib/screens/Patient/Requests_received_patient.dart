import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gap/gap.dart';

class RequestsReceivedPatient extends StatelessWidget {
  const RequestsReceivedPatient({Key? key}) : super(key: key);
  static String id = 'RequestsReceivedPatient';

  Future<void> acceptRequest(BuildContext context, String requestId,
      ScaffoldMessengerState scaffoldMessenger) async {
    try {
      // Get current user's ID
      String currentUserId = FirebaseAuth.instance.currentUser!.uid;

      // Fetch the request details
      DocumentSnapshot requestDoc = await FirebaseFirestore.instance
          .collection('FriendRequests')
          .doc(requestId)
          .get();
      Map<String, dynamic> requestData =
          requestDoc.data() as Map<String, dynamic>;
      String receiverId = requestData['receiverId'];
      String senderId = requestData['senderId'];
      String receiverFullName = requestData['receiverFullName'];

      // Check if the request is meant for the current user
      if (receiverId != currentUserId) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Invalid request')),
        );
        return;
      }

      // Update Firestore document to mark request as accepted
      await FirebaseFirestore.instance
          .collection('Shadow')
          .doc(senderId)
          .update({
        'friendsStatus': '$senderId accepted',
        'AcceptorName': receiverFullName
      });

      // Update sender's document in Users collection to add current user's ID
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(receiverId)
          .update({
        'friends': FieldValue.arrayUnion([senderId]),
      });

      // Remove the friend request from FriendRequests collection
      await FirebaseFirestore.instance
          .collection('FriendRequests')
          .doc(requestId)
          .delete();

      // Show a SnackBar to indicate success
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Request accepted')),
      );
    } catch (e) {
      // Handle errors gracefully, if any
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Failed to accept request: $e')),
      );
    }
  }

  Future<void> rejectRequest(BuildContext context, String requestId,
      ScaffoldMessengerState scaffoldMessenger) async {
    try {
      // Delete Firestore document to mark request as rejected
      await FirebaseFirestore.instance
          .collection('FriendRequests')
          .doc(requestId)
          .delete();

      // Show a SnackBar to indicate success
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Request rejected')),
      );
    } catch (e) {
      // Handle errors gracefully, if any
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Failed to reject request: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff69B5AB),
        title: const Text(
          'Requests Received',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF0F0F0),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('FriendRequests')
            .where('receiverId', isEqualTo: currentUserId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No friend requests found.'),
            );
          }

          return Builder(
            builder: (BuildContext context) {
              // Save a reference to ScaffoldMessengerState
              final scaffoldMessenger = ScaffoldMessenger.of(context);

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var request = snapshot.data!.docs[index];
                  var data = request.data() as Map<String, dynamic>;
                  String senderId = data['senderId'];
                  String senderUsername = data['SenderUserName'] ?? 'Unknown';

                  // Fetch sender details
                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(senderId)
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                      if (userSnapshot.hasError) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(senderUsername),
                            subtitle: const Text('Error fetching user details'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.check),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      if (userSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(senderUsername),
                            subtitle: const Text('Loading user details...'),
                          ),
                        );
                      }

                      if (userSnapshot.hasData) {
                        var userData =
                            userSnapshot.data!.data() as Map<String, dynamic>;
                        String senderFullName =
                            userData['fullname'] ?? 'No Name';

                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              senderFullName,
                              style: const TextStyle(fontSize: 17),
                            ),
                            subtitle: Text(
                              'Username: $senderUsername',
                              style: const TextStyle(fontSize: 15),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: IconButton(
                                    icon: const Icon(Icons.check),
                                    onPressed: () => acceptRequest(
                                        context, request.id, scaffoldMessenger),
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () => rejectRequest(
                                        context, request.id, scaffoldMessenger),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return const Center(
                        child: Text('No user data found.'),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
