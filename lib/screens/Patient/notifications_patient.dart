// ignore_for_file: deprecated_member_use
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

Future<void> scheduleNotification(
    int id, String title, String body, DateTime scheduledTime) async {
  final notificationContent = NotificationContent(
    id: id,
    channelKey: 'basic_channel', // Ensure it matches your channel
    title: title,
    body: body,
  );

  final now = DateTime.now();
  final secondsUntilScheduledTime = scheduledTime.difference(now).inSeconds;

  final timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

  final schedule = NotificationInterval(
    interval: secondsUntilScheduledTime, // Use calculated difference
    repeats: false,
    timeZone: timeZone,
  );


  await AwesomeNotifications().createNotification(
    content: notificationContent,
    schedule: schedule,
  );
}

class NotificationsPatient extends StatefulWidget {
  const NotificationsPatient({super.key});

  @override
  State<NotificationsPatient> createState() => _NotificationsPatientState();
}

class _NotificationsPatientState extends State<NotificationsPatient> {
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
        title: const Text('Schedule Notifications'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Get the current time
            final now = DateTime.now();

            final scheduledTime = now.add(const Duration(seconds: 10));

            await scheduleNotification(
                1, 'Reminder', 'Take your medication?', scheduledTime);
          },
          child: const Text('Schedule Notification'),
        ),
      ),
    );
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
