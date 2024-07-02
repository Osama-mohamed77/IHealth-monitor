import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ihealth_monitor/screens/Patient/notifications_patient.dart'; // Assuming this is a package you are using

class NotificationsShadow extends StatefulWidget {
  const NotificationsShadow({super.key});

  @override
  _NotificationsShadowState createState() => _NotificationsShadowState();
}

class _NotificationsShadowState extends State<NotificationsShadow> {
  List<Map<String, dynamic>> _savedNotifications = [];
  User? currentUser;

  @override
  void initState() {
    super.initState();
    // Get the current logged-in user
    currentUser = FirebaseAuth.instance.currentUser;
    // Fetch notifications on screen initialization
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    if (currentUser != null) {
      final notifications =
          await NotificationManager.getSavedNotifications(currentUser!.uid);
      setState(() {
        _savedNotifications = notifications;
      });
    }
  }

  Future<void> _deleteNotification(int id) async {
    if (currentUser != null) {
      await NotificationManager.clearSavedNotification(currentUser!.uid, id);
      _fetchNotifications();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffA9A360),
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Notifications')),
      ),
      body: _savedNotifications.isEmpty
          ? const Center(child: Text("You haven't received any notifications."))
          : ListView.builder(
              itemCount: _savedNotifications.length,
              itemBuilder: (context, index) {
                final notification = _savedNotifications[index];
                final title = notification['title'];
                final body = notification['body'];
                final id = notification['id'];
                final timestamp =
                    notification['timestamp']; // If you stored timestamps

                return Dismissible(
                  key: Key(id.toString()), // Use id as the key
                  direction:
                      DismissDirection.endToStart, // Swipe right to delete
                  onDismissed: (direction) async {
                    // Remove notification from list and storage
                    await _deleteNotification(id);
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      const Gap(15),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: const Color(0xffE4E4E4),
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            title: Text(
                              title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(body),
                            trailing: timestamp != null
                                ? Text(timestamp)
                                : null, // Display timestamp if available
                          ),
                        ),
                      ),
                      const Gap(15),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
