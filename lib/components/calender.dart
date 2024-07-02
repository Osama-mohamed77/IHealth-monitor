import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Calendar extends StatefulWidget {
  static String id = 'Calendar';
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // List<Measurementmodel> mesurmentList = [];

  // 1/5
  Map<DateTime, dynamic> customNumbers1 = {};
  Future<void> oneMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('7I2nij2cHUS8k0ktZKNiQVtx52u2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,6,1')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 6, 1);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers1 = tempCustomNumbers;
      });
    }
  }

  // 2/5
  Map<DateTime, dynamic> customNumbers2 = {};

  Future<void> twoMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('7I2nij2cHUS8k0ktZKNiQVtx52u2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,6,2')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 6, 2);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers2 = tempCustomNumbers;
      });
    }
  }

  // 3/5
  Map<DateTime, dynamic> customNumbers3 = {};

  Future<void> threeMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('7I2nij2cHUS8k0ktZKNiQVtx52u2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,6,3')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 6, 3);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers3 = tempCustomNumbers;
      });
    }
  }

  // 4/5

  Map<DateTime, dynamic> customNumbers4 = {};
  Future<void> fourMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('7I2nij2cHUS8k0ktZKNiQVtx52u2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,6,4')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 6, 4);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers4 = tempCustomNumbers;
      });
    }
  }

  // 5/5
  Map<DateTime, dynamic> customNumbers5 = {};
  Future<void> fiveMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('7I2nij2cHUS8k0ktZKNiQVtx52u2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,6,5')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 6, 5);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers5 = tempCustomNumbers;
      });
    }
  }

  // 6/5
  Map<DateTime, dynamic> customNumbers6 = {};
  Future<void> sixMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('7I2nij2cHUS8k0ktZKNiQVtx52u2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,6,6')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 6, 6);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers6 = tempCustomNumbers;
      });
    }
  }

  // 7/5
  Map<DateTime, dynamic> customNumbers7 = {};
  Future<void> sevenMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('7I2nij2cHUS8k0ktZKNiQVtx52u2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,6,7')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 6, 7);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers7 = tempCustomNumbers;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    oneMay();
    twoMay();
    threeMay();
    fourMay();
    fiveMay();
    sixMay();
    sevenMay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SfCalendar(
                view: CalendarView.month,
                monthViewSettings: const MonthViewSettings(dayFormat: 'EEE'),
                monthCellBuilder:
                    (BuildContext context, MonthCellDetails details) {
                  final currentDate = DateTime(
                      details.date.year, details.date.month, details.date.day);
                  final customNumber1 = customNumbers1[currentDate];
                  final customNumber2 = customNumbers2[currentDate];
                  final customNumber3 = customNumbers3[currentDate];
                  final customNumber4 = customNumbers4[currentDate];
                  final customNumber5 = customNumbers5[currentDate];
                  final customNumber6 = customNumbers6[currentDate];
                  final customNumber7 = customNumbers7[currentDate];
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            details.date.day.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      ///1
                      if (customNumber1 != null)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              customNumber1.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ////2
                      if (customNumber2 != null)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              customNumber2.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),

                      ////3
                      if (customNumber3 != null)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              customNumber3.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),

                      ////4
                      if (customNumber4 != null)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              customNumber4.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),

                      ////5
                      if (customNumber5 != null)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              customNumber5.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),

                      ////6
                      if (customNumber6 != null)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              customNumber6.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),

                      ////7
                      if (customNumber7 != null)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              customNumber7.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      if (customNumber1 == null &&
                          customNumber2 == null &&
                          customNumber3 == null &&
                          customNumber4 == null &&
                          customNumber5 == null &&
                          customNumber6 == null &&
                          customNumber7 == null)
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              '_',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}













// import 'package:flutter/material.dart';
// import 'package:ihealth_monitor/helper/measurement_model.dart';
// import 'package:table_calendar/table_calendar.dart';

// class Calendar extends StatefulWidget {
//   static String id = 'Calendar';

//   @override
//   _CalendarState createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   List<Measurementmodel> measurements = [];
//   CalendarFormat format = CalendarFormat.month;
//   DateTime selectedDay = DateTime.now();

//   // Function to group measurements by date
//   Map<DateTime, List<String>> groupMeasurementsByDate(
//       List<Measurementmodel> data) {
//     final Map<DateTime, List<String>> measurementsByDate = {};
//     for (final measurement in data) {
//       measurementsByDate[measurement.id]!.add(measurement.measurement);
//     }
//     return measurementsByDate;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final measurementsMap = groupMeasurementsByDate(measurements);

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Measurements Calendar'),
//         ),
//         body: Column(
//           children: [
//             TableCalendar<String>(
//               firstDay: DateTime(2023, 01, 01),
//               lastDay: DateTime(2025, 01, 01),
//               focusedDay: selectedDay,
//               calendarFormat: format,
//               selectedDayPredicate: (day) => isSameDay(selectedDay, day),
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   this.selectedDay = selectedDay;
//                   this.format = focusedDay;
//                 });
//               },
//               // Define calendarEvents property here
//               calendarEvents: measurementsMap,
//               // Define dayBuilder property here
//               dayBuilder: (context, day, _) {
//                 final eventsOnDay = measurementsMap[day] ?? [];
//                 return Container(
//                   decoration: selectedDay == day
//                       ? BoxDecoration(
//                           color: Colors.lightBlueAccent,
//                           borderRadius: BorderRadius.circular(5.0),
//                         )
//                       : null,
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(day.day.toString()),
//                         if (eventsOnDay.isNotEmpty)
//                           Text(
//                             '• ${eventsOnDay.join('\n• ')}',
//                             style: TextStyle(fontSize: 12.0),
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
