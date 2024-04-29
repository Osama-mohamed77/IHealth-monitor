// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/button.dart';
import 'package:ihealth_monitor/helper/ShowSnackBar.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/utils/config.dart';
import 'package:table_calendar/table_calendar.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({Key? key}) : super(key: key);
  static String id = 'ClinicScreen';

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  //declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String? selectedDay;
  String? drName;

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text('Clinic',
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
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
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
                          value: drName,
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
                              drName = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'Dr.osama mohamed',
                              child: Text('Dr.osama mohamed'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Dr.eslam mohamed',
                              child: Text('Dr.eslam mohamed'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Dr.Adham mohamed',
                              child: Text('Dr.Adham mohamed'),
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
                          _timeSelected = true;
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
                          '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
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
                    crossAxisCount: 4, childAspectRatio: 1.5),
              ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
            child: Button(
              width: double.infinity,
              title: 'Make Appointment',
              onPressed: () async {
                if (_currentIndex == 0) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 9:00 AM';
                  });
                } else if (_currentIndex == 1) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 10:00 AM';
                  });
                } else if (_currentIndex == 2) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 11:00 AM';
                  });
                } else if (_currentIndex == 3) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 12:00 PM';
                  });
                } else if (_currentIndex == 4) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 13:00 PM';
                  });
                } else if (_currentIndex == 5) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 14:00 PM';
                  });
                } else if (_currentIndex == 6) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 15:00 PM';
                  });
                } else if (_currentIndex == 7) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 16:00 PM';
                  });
                } else if (_currentIndex == 8) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 17:00 PM';
                  });
                } else if (_currentIndex == 9) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 18:00 PM';
                  });
                } else if (_currentIndex == 10) {
                  setState(() {
                    selectedDay =
                        '${_currentDay.day}/${_currentDay.month} : 19:00 PM';
                  });
                }
                try {
                  await MoreClass().bookingTime(
                      bookingTime: '${DateTime.now()}',
                      bookingDate: selectedDay.toString(),
                      doctorName: drName!);
                } catch (e) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    title: 'Warning',
                    desc: 'Choose a doctor',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  //table calendar
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
          _dateSelected = true;

          //check if weekend is selected
          if (selectedDay.weekday == 5 || selectedDay.weekday == 6) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }
}