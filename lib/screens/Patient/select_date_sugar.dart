import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/screens/Patient/enter_measurements_suger.dart';
import 'package:ihealth_monitor/screens/Patient/notifications_patient.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth

class SelectDateSuger extends StatefulWidget {
  const SelectDateSuger({super.key});
  static String id = 'SelectDateSuger';

  @override
  State<SelectDateSuger> createState() => _SelectDateSugerState();
}

class _SelectDateSugerState extends State<SelectDateSuger> {
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
    }).onError((error, stackTrace) => null);
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
                Text('Sugar Measurements',
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
                    width: 20,
                  ),
                  const Text('First measurement',
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
                          Text(_FirstTimeOfDay.format(context),
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
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text('Second measurement',
                      style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: 17,
                        color: Colors.black,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: _ShowTimePickerSecond,
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
                          Text(_SecondTimeOfDay.format(context).toString(),
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
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      User? currentUser = FirebaseAuth.instance.currentUser;
                      if (currentUser != null) {
                        // First notification
                        if (formKey.currentState!.validate()) {
                          await sugerNotification(
                              currentUser.uid,
                              2,
                              'Diabetes Reminder',
                              'It\'s time to measure your first diabetes.',
                              _FirstTimeOfDay);
                          // Second notification
                          isLoading = true;
                          setState(() {});
                          await MoreClass().datesMeasurementSuger(
                              firstTime:
                                  _FirstTimeOfDay.format(context).toString(),
                              secondTime:
                                  _SecondTimeOfDay.format(context).toString());

                          Navigator.pushNamed(
                              context, EnterMeasurementsSuger.id);
                          isLoading = false;
                          setState(() {});
                        } else if (formKey.currentState!.validate()) {
                          await sugerNotification(
                              currentUser.uid,
                              3,
                              'Diabetes Reminder',
                              'It\'s time to measure your second diabetes.',
                              _SecondTimeOfDay);
                        }
                      }
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
                        Navigator.pushNamed(context, EnterMeasurementsSuger.id);
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

Future<void> sugerNotification(String userId, int id, String title, String body,
    TimeOfDay scheduledTime) async {
  final notificationContent = NotificationContent(
    id: id,
    channelKey: 'basic_channel', // Ensure it matches your channel
    title: title,
    body: body,
  );

  final timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

  final schedule = NotificationInterval(
    interval: 10,
    repeats: false,
    timeZone: timeZone,
  );

  await AwesomeNotifications().createNotification(
    content: notificationContent,
    schedule: schedule,
  );
  await NotificationManager.saveNotification(userId, id, title, body);
}