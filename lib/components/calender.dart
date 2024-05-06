import 'package:flutter/material.dart';

import 'package:ihealth_monitor/helper/measurement_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Calendar extends StatefulWidget {
  static String id = 'Calendar';
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, dynamic> customNumbers = {};
  List<Measurementmodel> mesurmentList = [];

  Future fetchDataFromFirestore() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};
    final result = numbersCollection.docs
        .map((e) => Measurementmodel.fromMap(e.data()))
        .toList();
    mesurmentList = result;

    for (var doc in mesurmentList) {
      // DateTime date = DateTime(2024, 5, 22);
      // if(doc.id == DateTime())
      DateTime date = DateTime.parse(doc.date);
      dynamic number = doc.measurement;

      tempCustomNumbers[date] = number;
    }

    setState(() {
      customNumbers = tempCustomNumbers;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(border: Border.all()),
            child: SfCalendar(
              view: CalendarView.month,
              monthViewSettings: const MonthViewSettings(dayFormat: 'EEE'),
              monthCellBuilder:
                  (BuildContext context, MonthCellDetails details) {
                final currentDate = DateTime(
                    details.date.year, details.date.month, details.date.day);
                final customNumber = customNumbers[currentDate];
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
                    if (customNumber != null)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            customNumber.toString(),
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    if (customNumber == null)
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
