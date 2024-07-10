import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/button.dart';
import 'package:ihealth_monitor/helper/ShowSnackBar.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/helper/userProfile.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart';
import 'package:ihealth_monitor/helper/patient_const.dart';
import 'package:ihealth_monitor/screens/utils/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';

class TechnoClinic extends StatefulWidget {
  const TechnoClinic({Key? key}) : super(key: key);
  static String id = 'TechnoClinic';

  @override
  State<TechnoClinic> createState() => _TechnoClinicState();
}

class _TechnoClinicState extends State<TechnoClinic> {
  String clinicName = 'Techno clinic';

  String entryId = '';
  List<Map<String, String>> doctors = [];
  String? selectedDoctor;

  // Initializing the calendar and date variables
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  String? selectedDay;

  @override
  void initState() {
    super.initState();
    UserProfile().patientModel;
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    try {
      print('Fetching doctors for clinic: $clinicName');
      final snapshot = await FirebaseFirestore.instance
          .collection('Doctors')
          .where('Clinic name', isEqualTo: clinicName)
          .get();

      print('Number of documents fetched: ${snapshot.docs.length}');

      if (snapshot.docs.isEmpty) {
        print('No doctors found for clinic: $clinicName');
        setState(() {
          doctors = [];
          selectedDoctor = null;
        });
        return;
      }

      final List<Map<String, String>> fetchedDoctors = snapshot.docs.map((doc) {
        final data = doc.data();
        print('Document data: $data'); // Debugging statement
        return {'name': data['FullName'] as String, 'id': doc.id};
      }).toList();

      print('Doctor names fetched: $fetchedDoctors');

      setState(() {
        doctors = fetchedDoctors;
        if (fetchedDoctors.isNotEmpty) {
          selectedDoctor = fetchedDoctors.first['name'];
          entryId = fetchedDoctors.first['id']!;
        }
      });
    } catch (e) {
      print('Error fetching doctors: $e');
      ShowSnackBar(context, 'Error fetching doctor names');
    }
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff69B5AB),
        title: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(clinicName,
                style: const TextStyle(
                  fontFamily: 'alata',
                  fontSize: 30,
                  color: Colors.black,
                )),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Choose a doctor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffFBFBFB),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromARGB(255, 93, 92, 92))),
                      height: 45,
                      width: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: DropdownButton<String>(
                          value: selectedDoctor,
                          icon: const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                            ),
                          ),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 73, 71, 71),
                              fontFamily: 'alata',
                              fontSize: 13),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedDoctor = newValue!;
                              entryId = doctors.firstWhere((doctor) =>
                                  doctor['name'] == newValue)['id']!;
                            });
                          },
                          items: doctors.isNotEmpty
                              ? doctors.map((doctor) {
                                  return DropdownMenuItem<String>(
                                    value: doctor['name'],
                                    child: Text('Dr. ${doctor['name']}'),
                                  );
                                }).toList()
                              : [
                                  const DropdownMenuItem<String>(
                                    value: null,
                                    child: Text('No doctors available'),
                                  ),
                                ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              _tableCalendar(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: Center(
                  child: Text(
                    'Select Consultation Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        _isWeekend
            ? SliverToBoxAdapter(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  alignment: Alignment.center,
                  child: const Text(
                    'Weekend is not available, please select another date',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: _currentIndex == index
                              ? const Color(0xff69B5AB)
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 9}:00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _currentIndex == index ? Colors.white : null,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 11,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
                ),
              ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Button(
                width: double.infinity,
                title: 'Make Appointment',
                onPressed: () async {
                  if (_currentIndex != null) {
                    final times = [
                      '09:00',
                      '10:00',
                      '11:00',
                      '12:00',
                      '13:00',
                      '14:00',
                      '15:00',
                      '16:00',
                      '17:00',
                      '18:00',
                      '19:00'
                    ];
                    setState(() {
                      selectedDay =
                          '${_currentDay.day}/${_currentDay.month}/${_currentDay.year} : ${times[_currentIndex!]}';
                    });

                    if (selectedDoctor != null) {
                      await MoreClass().bookingClinic(
                          clinicName: clinicName,
                          bookingTime: '${DateTime.now()}',
                          bookingDate: selectedDay!,
                          doctorName: selectedDoctor!,
                          fullname: PatientConst.name,
                          age: PatientConst.age,
                          email: PatientConst.email,
                          phoneNumber: PatientConst.phoneNumber,
                          userName: PatientConst.userName,
                          gender: PatientConst.gender,
                          area: AddressConst.Area,
                          apartmentNumber: AddressConst.ApartmentNumber,
                          floorNumber: AddressConst.FloorNumber,
                          streetName: AddressConst.StreetName,
                          landlineNumber: AddressConst.LandlineNumber,
                          buildingName: AddressConst.BuildingName,
                          doctorID: entryId,
                          status: 'true');
                      await MoreClass().sendBookingToPatient(
                          doctorID: entryId,
                          bookingDate: selectedDay!,
                          bookingTime: '${DateTime.now()}',
                          doctorName: selectedDoctor!);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Success',
                        desc: 'The request has been completed',
                        btnOkOnPress: () {
                          Navigator.pushNamed(context, HomeNavBarPatient.id);
                        },
                      ).show();
                    } else {
                      ShowSnackBar(context, 'Enter all data');
                    }
                  } else {
                    ShowSnackBar(context, 'Enter all data');
                  }
                }),
          ),
        ),
      ]),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2030, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: Color(0xff69B5AB), shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;

          //check if weekend is selected
          if (selectedDay.weekday == 5 || selectedDay.weekday == 6) {
            _isWeekend = true;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }
}
