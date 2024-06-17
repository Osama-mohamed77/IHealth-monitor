import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MoreDeteilsShadow extends StatefulWidget {
  const MoreDeteilsShadow({super.key});
  static String id = 'moreDeteilsShadow';

  @override
  State<MoreDeteilsShadow> createState() => _MoreDeteilsShadowState();
}

class _MoreDeteilsShadowState extends State<MoreDeteilsShadow> {
  ///Sugar Measurement

  // 1/5
  Map<DateTime, dynamic> customNumbers1 = {};
  Future<void> oneMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,1')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 1);
      dynamic number = numbersCollection.data()!['first'];

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
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,2')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 2);
      dynamic number = numbersCollection.data()!['first'];

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
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,3')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 3);
      dynamic number = numbersCollection.data()!['first'];

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
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,4')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 4);
      dynamic number = numbersCollection.data()!['first'];

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
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,5')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 5);
      dynamic number = numbersCollection.data()!['first'];

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
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,6')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 6);
      dynamic number = numbersCollection.data()!['first'];

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
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,7')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 7);
      dynamic number = numbersCollection.data()!['first'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers7 = tempCustomNumbers;
      });
    }
  } // 8/5

  Map<DateTime, dynamic> customNumbers8 = {};
  Future<void> eightMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,8')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 8);
      dynamic number = numbersCollection.data()!['first'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers8 = tempCustomNumbers;
      });
    }
  }

// 9/5
  Map<DateTime, dynamic> customNumbers9 = {};
  Future<void> nineMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,9')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 9);
      dynamic number = numbersCollection.data()!['first'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers9 = tempCustomNumbers;
      });
    }
  }

  // 10/5
  Map<DateTime, dynamic> customNumbers10 = {};
  Future<void> tenMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,10')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 10);
      dynamic number = numbersCollection.data()!['first'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers10 = tempCustomNumbers;
      });
    }
  }

  // 17/5
  Map<DateTime, dynamic> customNumbers17 = {};
  Future<void> seventeenMay() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,17')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 5, 17);
      dynamic number = numbersCollection.data()!['first'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers17 = tempCustomNumbers;
      });
    }
  }

  // 6/6
  Map<DateTime, dynamic> customNumbers66 = {};
  Future<void> sixJune() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,6,6')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['first'] is String) {
      DateTime date = DateTime(2024, 6, 6);
      dynamic number = numbersCollection.data()!['first'];

      tempCustomNumbers[date] = number;
      setState(() {
        customNumbers66 = tempCustomNumbers;
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
    eightMay();
    nineMay();
    tenMay();
    sixJune();
    seventeenMay();
    oneMayPressure();
    twoMayPressure();
    threeMayPressure();
    fourMayPressure();
    fiveMayPressure();
    sixMayPressure();
    sevenMayPressure();
    eightMayPressure();
    nineMayPressure();
    tenMayPressure();
    seventeenMayPressure();
    sixJunePressure();
  }

  ////Pressure Measurement

  // 1/5
  Map<DateTime, dynamic> day1 = {};
  Future<void> oneMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,1')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 1);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day1 = tempCustomNumbers;
      });
    }
  }

  // 2/5
  Map<DateTime, dynamic> day2 = {};

  Future<void> twoMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,2')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 2);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day2 = tempCustomNumbers;
      });
    }
  }

  // 3/5
  Map<DateTime, dynamic> day3 = {};

  Future<void> threeMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,3')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 3);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day3 = tempCustomNumbers;
      });
    }
  }

  // 4/5

  Map<DateTime, dynamic> day4 = {};
  Future<void> fourMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,4')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 4);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day4 = tempCustomNumbers;
      });
    }
  }

  // 5/5
  Map<DateTime, dynamic> day5 = {};
  Future<void> fiveMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,5')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 5);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day5 = tempCustomNumbers;
      });
    }
  }

  // 6/5
  Map<DateTime, dynamic> day6 = {};
  Future<void> sixMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,6')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 6);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day6 = tempCustomNumbers;
      });
    }
  }

  // 7/5
  Map<DateTime, dynamic> day7 = {};
  Future<void> sevenMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,7')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 7);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day7 = tempCustomNumbers;
      });
    }
  }

// 8/5
  Map<DateTime, dynamic> day8 = {};
  Future<void> eightMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,8')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 8);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day8 = tempCustomNumbers;
      });
    }
  }

// 9/5
  Map<DateTime, dynamic> day9 = {};
  Future<void> nineMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,9')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 9);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day9 = tempCustomNumbers;
      });
    }
  }

// 10/5
  Map<DateTime, dynamic> day10 = {};
  Future<void> tenMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,10')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 10);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day10 = tempCustomNumbers;
      });
    }
  }

  // 17/5
  Map<DateTime, dynamic> day17 = {};
  Future<void> seventeenMayPressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc('2024,5,17')
        .get();

    Map<DateTime, dynamic> tempCustomNumbers = {};

    if (numbersCollection.exists &&
        numbersCollection.data()!['measurement'] is String) {
      DateTime date = DateTime(2024, 5, 17);
      dynamic number = numbersCollection.data()!['measurement'];

      tempCustomNumbers[date] = number;
      setState(() {
        day17 = tempCustomNumbers;
      });
    }
  }

  // 6/6
  Map<DateTime, dynamic> day66 = {};
  Future<void> sixJunePressure() async {
    var numbersCollection = await FirebaseFirestore.instance
        .collection('Patients')
        .doc('6CRVQ2LC6OX1GhRso45Z4iM4Lev2')
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
        day66 = tempCustomNumbers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Text('Mohamed abdallah',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 25,
                    color: Colors.black,
                  )),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xffFFFEFB),
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  textAlign: TextAlign.start,
                  'Blood sugar measurements',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
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
                    final currentDate = DateTime(details.date.year,
                        details.date.month, details.date.day);
                    final customNumber1 = customNumbers1[currentDate];
                    final customNumber2 = customNumbers2[currentDate];
                    final customNumber3 = customNumbers3[currentDate];
                    final customNumber4 = customNumbers4[currentDate];
                    final customNumber5 = customNumbers5[currentDate];
                    final customNumber6 = customNumbers6[currentDate];
                    final customNumber7 = customNumbers7[currentDate];
                    final customNumber8 = customNumbers8[currentDate];
                    final customNumber9 = customNumbers9[currentDate];
                    final customNumber10 = customNumbers10[currentDate];
                    final customNumber17 = customNumbers17[currentDate];
                    final customNumber66 = customNumbers66[currentDate];
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
                        ////8
                        if (customNumber8 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                customNumber8.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ////9
                        if (customNumber9 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                customNumber9.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ////10
                        if (customNumber10 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                customNumber10.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ////17
                        if (customNumber17 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                customNumber17.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////6/6
                        if (customNumber66 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                customNumber66.toString(),
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
                            customNumber7 == null &&
                            customNumber8 == null &&
                            customNumber9 == null &&
                            customNumber10 == null &&
                            customNumber17 == null &&
                            customNumber66 == null)
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
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  textAlign: TextAlign.start,
                  'Blood pressure measurement',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
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
                    final currentDate = DateTime(details.date.year,
                        details.date.month, details.date.day);
                    final dayNumber1 = day1[currentDate];
                    final dayNumber2 = day2[currentDate];
                    final dayNumber3 = day3[currentDate];
                    final dayNumber4 = day4[currentDate];
                    final dayNumber5 = day5[currentDate];
                    final dayNumber6 = day6[currentDate];
                    final dayNumber7 = day7[currentDate];
                    final dayNumber8 = day8[currentDate];
                    final dayNumber9 = day9[currentDate];
                    final dayNumber10 = day10[currentDate];
                    final dayNumber17 = day17[currentDate];
                    final dayNumber66 = day66[currentDate];

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
                        if (dayNumber1 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber1.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ////2
                        if (dayNumber2 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber2.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////3
                        if (dayNumber3 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber3.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////4
                        if (dayNumber4 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber4.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////5
                        if (dayNumber5 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber5.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////6
                        if (dayNumber6 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber6.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////7
                        if (dayNumber7 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber7.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ////8
                        if (dayNumber8 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber8.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////9
                        if (dayNumber9 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber9.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////10
                        if (dayNumber10 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber10.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ////17
                        if (dayNumber17 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber17.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        ////6/6
                        if (dayNumber66 != null)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                dayNumber66.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                        if (dayNumber1 == null &&
                            dayNumber2 == null &&
                            dayNumber3 == null &&
                            dayNumber4 == null &&
                            dayNumber5 == null &&
                            dayNumber6 == null &&
                            dayNumber7 == null &&
                            dayNumber8 == null &&
                            dayNumber9 == null &&
                            dayNumber10 == null &&
                            dayNumber17 == null &&
                            dayNumber66 == null)
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
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  textAlign: TextAlign.start,
                  'Test results',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    width: 310,
                    height: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: const Color(0xffFFFEFB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/Test.jpg'),
                            ),
                            Container(
                              height: 3,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.black,
                              ),
                            ),
                            const Image(
                              image: AssetImage('assets/images/test 2.jpg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
