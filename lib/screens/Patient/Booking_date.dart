import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingDate extends StatefulWidget {
  static String id = 'BookingDate';
  const BookingDate({super.key});

  @override
  State<BookingDate> createState() => _BookingDateState();
}

class _BookingDateState extends State<BookingDate> {
  //clinic
  IconData emptyIconClinic = const IconData(0, fontFamily: 'MaterialIcons');

  bool? declined;
  String dataClinc = '';
  String clinicName = '';
  String bookingDateClinic = '';
  String doctorNameClinic = '';
  String AppointmentStatusClinic = 'Waiting for approval';
  int colorClinic = 0xffDDDBDB;
  Icon iconClinic = const Icon(Icons.hourglass_bottom);

  Future<void> fetchBookingDateClinic() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('reservation')
          .doc(FirebaseAuth
              .instance.currentUser!.uid) // Use the correct document ID here
          .get();
      if (documentSnapshot.exists) {
        setState(() {
          dataClinc = 'data';
        });
      } else {
        setState(() {
          dataClinc = '';
        });
      }
      if (documentSnapshot.exists) {
        setState(() {
          bookingDateClinic = documentSnapshot['bookingDate'];
          doctorNameClinic = documentSnapshot['doctorName'];
          clinicName = documentSnapshot['Clinic name'];
          declined = documentSnapshot['declined'];
        });
      }
      if (declined == false) {
        setState(() {
          AppointmentStatusClinic = 'Declined';
          iconClinic = Icon(emptyIconClinic);
          colorClinic = 0xffEB1818;
        });
      } else {}
    } catch (e) {
      return;
    }
  }

  Future<void> fetchApprovalClinic() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients list')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          AppointmentStatusClinic = 'Approved';
          colorClinic = 0xff69B5AB;
          iconClinic = Icon(emptyIconClinic);
        });
      } else {}
    } catch (e) {
      return;
    }
  }
  //Laboratory

  IconData emptyIconLab = const IconData(0, fontFamily: 'MaterialIcons');
  String dataLab = '';
  String labName = '';
  String bookingDateLab = '';
  String AppointmentStatusLab = 'Waiting for approval';
  int colorLab = 0xffDDDBDB;
  Icon iconLab = const Icon(Icons.hourglass_bottom);

  Future<void> fetchBookingDateLab() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('reservation lab')
          .doc(FirebaseAuth
              .instance.currentUser!.uid) // Use the correct document ID here
          .get();
      if (documentSnapshot.exists) {
        setState(() {
          dataLab = 'data';
        });
      } else {
        setState(() {
          dataLab = '';
        });
      }
      if (documentSnapshot.exists) {
        setState(() {
          bookingDateLab = documentSnapshot['bookingDate'];
          labName = documentSnapshot['Lab name'];
        });
      } else {}
    } catch (e) {
      return;
    }
  }

  Future<void> fetchApprovalLab() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('LabPatients')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          AppointmentStatusLab = 'Approved';
          colorLab = 0xff69B5AB;
          iconLab = Icon(emptyIconLab);
        });
      } else {}
    } catch (e) {
      return;
    }
  }
//pharmacy

  IconData emptyIconPha = const IconData(0, fontFamily: 'MaterialIcons');
  String dataPha = '';
  String deviceType = '';
  String PhaName = '';
  String bookingDatePha = '';
  String AppointmentStatusPha = 'Waiting for approval';
  int colorPha = 0xffDDDBDB;
  Icon iconPha = const Icon(Icons.hourglass_bottom);

  Future<void> fetchBookingDatePha() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('OrderList')
          .doc(FirebaseAuth
              .instance.currentUser!.uid) // Use the correct document ID here
          .get();
      if (documentSnapshot.exists) {
        setState(() {
          dataPha = 'data';
        });
      } else {
        setState(() {
          dataPha = '';
        });
      }
      if (documentSnapshot.exists) {
        setState(() {
          bookingDatePha = documentSnapshot['Date'];
          PhaName = documentSnapshot['pharmacyName'];
          deviceType = documentSnapshot['deviceType'];
        });
      } else {}
    } catch (e) {
      return;
    }
  }

  Future<void> fetchApprovalPha() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('PatientOrders')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          AppointmentStatusPha = 'Approved';
          colorPha = 0xff69B5AB;
          iconPha = Icon(emptyIconLab);
        });
      } else {}
    } catch (e) {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBookingDateClinic();
    fetchApprovalClinic();
    fetchBookingDateLab();
    fetchApprovalLab();
    fetchBookingDatePha();
    fetchApprovalPha();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xff69B5AB),
        title: const Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text('Booking date',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 30,
                  color: Colors.black,
                )),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),

          ///clinic
          if (dataClinc == 'data')
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        const Text(
                          'Clinic',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 76, 155, 145)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.date_range_sharp,
                              color: Colors.red,
                            ),
                            Text('Booking Date: $bookingDateClinic'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                            Text('Doctor name: $doctorNameClinic'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.home,
                              color: Colors.red,
                            ),
                            Text('Clinic name: $clinicName'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Color(colorClinic)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  AppointmentStatusClinic,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              iconClinic
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          const SizedBox(
            height: 30,
          ),
          if (dataLab == 'data')
            //laboratory
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        const Text(
                          'Laboratory',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 76, 155, 145)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.date_range_sharp,
                              color: Colors.red,
                            ),
                            Text('Booking Date: $bookingDateLab'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.home,
                              color: Colors.red,
                            ),
                            Text('laboratory name: $labName'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Color(colorLab)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  AppointmentStatusLab,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              iconLab
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          const SizedBox(
            height: 30,
          ),

          ///pharmacy
          if (dataPha == 'data')
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        const Text(
                          'Measuring devices',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 76, 155, 145)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.date_range_sharp,
                              color: Colors.red,
                            ),
                            Text('Booking Date: $bookingDatePha'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.medication_liquid,
                              color: Colors.red,
                            ),
                            Text('Device type: $deviceType'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.home,
                              color: Colors.red,
                            ),
                            Text('Pharmacy name: $PhaName'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Color(colorPha)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  AppointmentStatusPha,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              iconPha
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
        ],
      ),
    );
  }
}

Future<void> Notification(int id, String title, String body) async {
  final notificationContent = NotificationContent(
    id: id,
    channelKey: 'basic_channel', // Ensure it matches your channel
    title: title,
    body: body,
  );

  await AwesomeNotifications().createNotification(
    content: notificationContent,
  );
}

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class BookingDate extends StatefulWidget {
//   static String id = 'BookingDate';
//   const BookingDate({super.key});

//   @override
//   State<BookingDate> createState() => _BookingDateState();
// }

// class _BookingDateState extends State<BookingDate> {
//   IconData emptyIcon = const IconData(0, fontFamily: 'MaterialIcons');
//   String bookingDate = '';
//   String doctorName = '';
//   String AppointmentStatus = 'Waiting for approval';
//   int color = 0xffDDDBDB;
//   Icon icon = const Icon(Icons.hourglass_bottom);

//   @override
//   void initState() {
//     super.initState();
//     fetchBookingDate();
//     fetchApproval();
//     AwesomeNotifications().initialize(null, [
//       NotificationChannel(
//         channelGroupKey: 'basic_channel_group',
//         channelKey: 'basic_channel',
//         channelName: 'Basic Notification',
//         channelDescription: 'Test notification channel',
//       ),
//     ], channelGroups: [
//       NotificationChannelGroup(
//           channelGroupKey: 'basic_channel_group',
//           channelGroupName: 'Basic Group'),
//     ]);
//   }

//   Future<void> fetchBookingDate() async {
//     try {
//       DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//           .collection('Patients')
//           .doc(FirebaseAuth
//               .instance.currentUser!.uid) // Use the correct document ID here
//           .get();

//       if (documentSnapshot.exists) {
//         setState(() {
//           bookingDate = documentSnapshot['bookingDate'];
//           doctorName = documentSnapshot['doctorName'];
//         });
//       } else {
//          
//       }
//     } catch (e) {
//        
//     }
//   }

//   Future<void> fetchApproval() async {
//     try {
//       DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//           .collection('Patients list')
//           .doc(FirebaseAuth
//               .instance.currentUser!.uid) // Use the correct document ID here
//           .get();

//       if (documentSnapshot.exists) {
//         setState(() {
//           AppointmentStatus = 'Approved';
//           color = 0xff69B5AB;
//           icon = Icon(emptyIcon);
//         });
//         sugerNotification(
//             5, 'appointment Reminder', 'Your request has been approved.');
//       } else {
//          
//       }
//     } catch (e) {
//        
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF0F0F0),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff69B5AB),
//         title: const Row(
//           children: [
//             Spacer(
//               flex: 1,
//             ),
//             Text('Booking date',
//                 style: TextStyle(
//                   fontFamily: 'alata',
//                   fontSize: 30,
//                   color: Colors.black,
//                 )),
//             Spacer(
//               flex: 2,
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         children: [
//           const SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 child: Container(
//                   height: 170,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                       border: Border.all(color: Colors.grey)),
//                   child: Column(
//                     children: [
//                       const Text(
//                         'Clinic',
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Color.fromARGB(255, 76, 155, 145)),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.date_range_sharp,
//                             color: Colors.red,
//                           ),
//                           Text('Booking Date: $bookingDate'),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.person,
//                             color: Colors.red,
//                           ),
//                           Text('Doctor named: $doctorName'),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         height: 30,
//                         width: 250,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.grey),
//                             color: Color(color)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 15),
//                               child: Text(
//                                 AppointmentStatus,
//                                 style: const TextStyle(fontSize: 18),
//                               ),
//                             ),
//                             icon
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// Future<void> sugerNotification(int id, String title, String body) async {
//   final notificationContent = NotificationContent(
//     id: id,
//     channelKey: 'basic_channel', // Ensure it matches your channel
//     title: title,
//     body: body,
//   );

//   // final now = DateTime.now();
//   // final secondsUntilScheduledTime = scheduledTime.difference(now).inSeconds;

//   final timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

//   final schedule = NotificationInterval(
//     interval: 10,
//     repeats: false,
//     timeZone: timeZone,
//   );

//   await AwesomeNotifications().createNotification(
//     content: notificationContent,
//     schedule: schedule,
//   );
// }
