import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ihealth_monitor/screens/Doctor/HomeNav_Bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MoreBloodPressureDetails extends StatefulWidget {
  final String patientId;

  const MoreBloodPressureDetails({required this.patientId, super.key});
  static String id = 'MoreBloodPressureDetails';

  @override
  State<MoreBloodPressureDetails> createState() =>
      _MoreBloodPressureDetailsState();
}

class _MoreBloodPressureDetailsState extends State<MoreBloodPressureDetails> {
  String fullName = '';
  String imageUrl = '';
  Map<DateTime, dynamic> customNumbers = {};

  @override
  void initState() {
    super.initState();
    fetchName();
    fetchImage();
    fetchPressureMeasurements();
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

  final _fireStore = FirebaseFirestore.instance;
  Future<void> TrueFlag() async {
    _fireStore
        .collection('Patients')
        .doc(widget.patientId)
        .update({'flag': 'true'}).catchError((error) => null);
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
        customNumbers = tempCustomNumbers;
        print('Custom Numbers: $customNumbers'); // Debug print
      });
    } catch (e) {
      print('Error fetching measurements: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff92B28F),
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
                  final customNumber = customNumbers[currentDate];

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
          Center(
            child: GestureDetector(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.question,
                  animType: AnimType.scale,
                  title: 'Wait',
                  desc: 'Are you sure to request an urgent appointment?',
                  btnOkOnPress: () {
                    TrueFlag();
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.scale,
                      title: 'Success',
                      btnOkOnPress: () {
                        Navigator.pushNamed(context, HomeNavBarDoctor.id);
                      },
                    ).show();
                  },
                  btnCancelOnPress: () {},
                ).show();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFF5E5E),
                ),
                height: 55,
                width: 200,
                child: const Center(
                  child: Text(
                    'Urgent appointment',
                    style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 19,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
