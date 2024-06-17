// ignore_for_file: deprecated_member_use
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationsPatient extends StatefulWidget {
  const NotificationsPatient({super.key});

  @override
  State<NotificationsPatient> createState() => _NotificationsPatientState();
}

class _NotificationsPatientState extends State<NotificationsPatient> {
  @override
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Test notification channel',
      ),
    ], channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic Group'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Center(child: const Text('Schedule Notifications')),
    ));
  }
}






// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';

// class NotificationsPatient extends StatelessWidget {
//   const NotificationsPatient({Key? key}) : super(key: key);

//   static String id = 'notificationsPatient';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color(0xff69B5AB),
//         title: const Center(
//           child: Text(
//             'Notifications',
//             style: TextStyle(
//               fontFamily: 'alata',
//               fontSize: 25,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: const Color(0xffF0F0F0),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Define the time when you want to send the notification
//           DateTime scheduledDate =
//               DateTime.now().add(const Duration(seconds: 5));

//           AwesomeNotifications().createNotification(
//             content: NotificationContent(
//               id: 1,
//               channelKey: 'basic_channel',
//               title: 'Hello world',
//               body: 'Yes, I have a local notification now',
//             ),
//             schedule: NotificationCalendar.fromDate(date: scheduledDate),
//           );
//           print(scheduledDate);
//         },
//         child: const Icon(Icons.notification_add),
//       ),
//     );
//   }
// }
