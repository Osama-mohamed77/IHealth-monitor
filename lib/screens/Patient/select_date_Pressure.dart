// ignore_for_file: use_build_context_synchronously, file_names, prefer_final_fields, unused_field, non_constant_identifier_names, unused_element

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/Patient/enter_measurements_Pressure.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SelectDateBlood extends StatefulWidget {
  const SelectDateBlood({super.key});
  static String id = 'SelectDateBlood';

  @override
  State<SelectDateBlood> createState() => _SelectDateBloodState();
}

class _SelectDateBloodState extends State<SelectDateBlood> {
  int _page = 0;
  bool isLoading = false;
  TimeOfDay _FirstTimeOfDay = const TimeOfDay(hour: 00, minute: 00);
  GlobalKey<FormState> formKey = GlobalKey();
  _ShowTimePickerFirst() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _FirstTimeOfDay = value!;
      });
    }).onError((error, stackTrace) => null);
  }

  TimeOfDay _SecondTimeOfDay = const TimeOfDay(hour: 00, minute: 00);
  _ShowTimePickerSecond() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _SecondTimeOfDay = value!;
      });
    });
  }

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
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff69B5AB),
            title: const Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Text('Enter measurements',
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
          backgroundColor: const Color(0xffF0F0F0),
          body: ListView(
            children: [
              const SizedBox(
                height: 90,
              ),
              const Center(
                child: Text(
                    'Enter the dates for entering \n          measurements',
                    style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 23,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 90,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Text('Select date',
                      style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: 17,
                        color: Colors.black,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: _ShowTimePickerFirst,
                    child: Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          Text(_FirstTimeOfDay.format(context).toString(),
                              style: const TextStyle(
                                fontFamily: 'alata',
                                fontSize: 15,
                                color: Colors.black,
                              )),
                          const Spacer(
                            flex: 1,
                          ),
                          const Icon(
                            Icons.timer,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // final now = DateTime.now();

                      // final scheduledTime = now.add(const Duration(seconds: 7));

                      await scheduleNotification(
                          1,
                          'Blood Pressure Reminder',
                          'It\'s time to take your blood pressure reading.',
                          _FirstTimeOfDay);

                      isLoading = true;
                      setState(() {});
                      await MoreClass().datesMeasurementPressure(
                        firstTime: _FirstTimeOfDay.format(context).toString(),
                      );

                      Navigator.pushNamed(
                          context, EnterMeasurementsPressure.id);
                      isLoading = false;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 135,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                          color: const Color(0xff69B5AB),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text('Save',
                            style: TextStyle(
                              fontFamily: 'alata',
                              fontSize: 25,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isLoading = true;
                        setState(() {});
                        Navigator.pushNamed(
                            context, EnterMeasurementsPressure.id);
                        isLoading = false;
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text('Skip',
                              style: TextStyle(
                                fontFamily: 'alata',
                                fontSize: 25,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> scheduleNotification(
    int id, String title, String body, TimeOfDay scheduledTime) async {
  final notificationContent = NotificationContent(
    id: id,
    channelKey: 'basic_channel', // Ensure it matches your channel
    title: title,
    body: body,
  );

  // final now = DateTime.now();
  // final secondsUntilScheduledTime = scheduledTime.difference(now).inSeconds;

  final timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

  final schedule = NotificationInterval(
    interval: const Duration(days: 1).inSeconds, // Use calculated difference
    repeats: true,
    timeZone: timeZone,
  );

  await AwesomeNotifications().createNotification(
    content: notificationContent,
    schedule: schedule,
  );
}
