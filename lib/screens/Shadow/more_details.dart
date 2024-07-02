import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MoreDeteilsShadow extends StatefulWidget {
  final String patientId;

  const MoreDeteilsShadow({required this.patientId, super.key});
  static String id = 'MoreBloodPressureDetails';

  @override
  State<MoreDeteilsShadow> createState() => _MoreDeteilsShadowState();
}

class _MoreDeteilsShadowState extends State<MoreDeteilsShadow> {
  String fullName = '';
  String imageUrl = '';
  Map<DateTime, dynamic> pressureMeasurements = {};
  Map<DateTime, dynamic> sugarMeasurements = {};

  @override
  void initState() {
    super.initState();
    fetchName();
    fetchImage();
    fetchPressureMeasurements();
    fetchSugarMeasurements();
  }

  Future<void> fetchName() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc(widget.patientId)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          fullName = documentSnapshot['FullName'];
        });
      }
    } catch (e) {
      print('Error fetching name: $e');
    }
  }

  Future<void> fetchImage() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients list')
          .doc(widget.patientId)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          imageUrl = documentSnapshot['imageUrl'];
        });
      }
    } catch (e) {
      print('Error fetching image: $e');
    }
  }

  Future<void> fetchPressureMeasurements() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc(widget.patientId)
          .collection('Pressure Measurement')
          .doc('measurements dates')
          .collection('measurements')
          .get();

      Map<DateTime, dynamic> tempCustomNumbers = {};
      for (var doc in querySnapshot.docs) {
        List<String> parts = doc.id.split(',');
        DateTime date = DateTime(
          int.parse(parts[0]),
          int.parse(parts[1]),
          int.parse(parts[2]),
        );
        dynamic number = doc['measurement'];
        tempCustomNumbers[date] = number;
      }
      setState(() {
        pressureMeasurements = tempCustomNumbers;
        print('Pressure Measurements: $pressureMeasurements'); // Debug print
      });
    } catch (e) {
      print('Error fetching pressure measurements: $e');
    }
  }

  Future<void> fetchSugarMeasurements() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc(widget.patientId)
          .collection('Sugar Measurement')
          .doc('measurements dates')
          .collection('measurements')
          .get();

      Map<DateTime, dynamic> tempCustomNumbers = {};
      for (var doc in querySnapshot.docs) {
        List<String> parts = doc.id.split(',');
        DateTime date = DateTime(
          int.parse(parts[0]),
          int.parse(parts[1]),
          int.parse(parts[2]),
        );
        dynamic number = doc['Average'];
        tempCustomNumbers[date] = number;
      }
      setState(() {
        sugarMeasurements = tempCustomNumbers;
        print('Sugar Measurements: $sugarMeasurements'); // Debug print
      });
    } catch (e) {
      print('Error fetching sugar measurements: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffA9A360),
        title: Row(
          children: [
            const Spacer(flex: 1),
            Text(
              fullName,
              style: const TextStyle(
                fontFamily: 'alata',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const Row(
            children: [
              SizedBox(width: 20),
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
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  final customNumber = pressureMeasurements[currentDate];
                  int minColor = 0xffBDB500;
                  int maxColor = 0xffC00000;
                  int normalColor = 0xff92B28F;
                  int finishColor = 0xffFFFFFF;

                  if (customNumber != null) {
                    List<String> pressures = customNumber.split('/');
                    int systolic = int.parse(pressures[0]);
                    int diastolic = int.parse(pressures[1]);

                    if (systolic < 90 || diastolic < 60) {
                      finishColor = minColor;
                    } else if (systolic >= 90 &&
                        systolic <= 120 &&
                        diastolic >= 60 &&
                        diastolic <= 80) {
                      finishColor = normalColor;
                    } else if (systolic > 120 || diastolic > 80) {
                      finishColor = maxColor;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(finishColor),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Center(
                              child: Text(
                                details.date.day.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, height: -1),
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
                                      fontSize: 11,
                                      color: Colors.white,
                                      height: 2),
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
                                    height: 2.5,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              SizedBox(width: 20),
              Text(
                textAlign: TextAlign.start,
                'Blood sugar measurement',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  final customNumber = sugarMeasurements[currentDate];
                  int minColor = 0xffBDB500;
                  int maxColor = 0xffC00000;
                  int normalColor = 0xff92B28F;
                  int finishColor = 0xffFFFFFF;

                  if (customNumber != null) {
                    if (customNumber < 70) {
                      finishColor = minColor;
                    } else if (customNumber >= 70 && customNumber <= 140) {
                      finishColor = normalColor;
                    } else if (customNumber > 140) {
                      finishColor = maxColor;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(finishColor),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Center(
                              child: Text(
                                details.date.day.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, height: -1),
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
                                      fontSize: 11,
                                      color: Colors.white,
                                      height: 2),
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
                                    height: 2.5,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              SizedBox(width: 20),
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
          const SizedBox(height: 10),
          if (imageUrl != '')
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    width: 310,
                    height: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: const Color(0xffFFFEFB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(imageUrl),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          if (imageUrl == '')
            Row(
              children: [
                const Gap(20),
                Expanded(
                  child: SizedBox(
                    height: 300,
                    width: 250,
                    child: Image.asset('assets/images/gif test.gif'),
                  ),
                ),
                const Gap(20),
              ],
            ),
          const Gap(30),
        ],
      ),
    );
  }
}
