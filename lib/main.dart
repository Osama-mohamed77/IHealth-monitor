// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/HomeNav_Bar.dart';
import 'package:ihealth_monitor/components/calender.dart';
import 'package:ihealth_monitor/components/splash_screen.dart';
import 'package:ihealth_monitor/firebase_options.dart';
import 'package:ihealth_monitor/helper/notification_service.dart';
import 'package:ihealth_monitor/helper/notifications.dart';
import 'package:ihealth_monitor/screens/Doctor/blood_pressure_patients.dart';
import 'package:ihealth_monitor/screens/Doctor/Account%20details.dart';
import 'package:ihealth_monitor/screens/Doctor/Add%20patients.dart';
import 'package:ihealth_monitor/helper/blood_test.dart';
import 'package:ihealth_monitor/screens/Doctor/Diabetics%20screen.dart';
import 'package:ihealth_monitor/screens/Doctor/Bpmore%20deteils.dart';
import 'package:ihealth_monitor/screens/Doctor/Dpmore%20deteils.dart';
import 'package:ihealth_monitor/screens/Doctor/Home.dart';
import 'package:ihealth_monitor/screens/Doctor/Requests%20received.dart';
import 'package:ihealth_monitor/screens/Patient/Add%20address.dart';
import 'package:ihealth_monitor/screens/Patient/add_screen.dart';
import 'package:ihealth_monitor/screens/Patient/enter_measurements_Pressure.dart';
import 'package:ihealth_monitor/screens/Patient/Measuring%20devices.dart';
import 'package:ihealth_monitor/screens/Patient/add_Followers.dart';
import 'package:ihealth_monitor/screens/Patient/choose%20Type.dart';
import 'package:ihealth_monitor/screens/Patient/Forget%20patient.dart';
import 'package:ihealth_monitor/screens/Patient/Home%20Patient.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart';
import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
import 'package:ihealth_monitor/screens/Patient/clinic.dart';
import 'package:ihealth_monitor/screens/Patient/creat%20patient.dart';
import 'package:ihealth_monitor/screens/Patient/lab.dart';
import 'package:ihealth_monitor/screens/Patient/pharmacies/19011.dart';
import 'package:ihealth_monitor/screens/Patient/pharmacies/El_Ezaby.dart';
import 'package:ihealth_monitor/screens/Patient/pharmacies/Eltarshouby.dart';
import 'package:ihealth_monitor/screens/Patient/pharmacies/misr_Pharmacy.dart';
import 'package:ihealth_monitor/screens/Patient/select_date_Pressure.dart';
import 'package:ihealth_monitor/screens/Patient/select_date_suger.dart';
import 'package:ihealth_monitor/screens/Patient/settings_patient.dart';
import 'package:ihealth_monitor/screens/Patient/sign%20up%20Patient.dart';
import 'package:ihealth_monitor/screens/Patient/test_result.dart';
import 'package:ihealth_monitor/screens/Patient/verify%20patient.dart';
import 'package:ihealth_monitor/screens/Shadow/Add%20patients%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Forget%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Hom%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Home%20Nav%20Bar.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20in%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20up%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/creat%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/more%20details.dart';
import 'package:ihealth_monitor/screens/Shadow/notifications%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/settings%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/verify%20shadow.dart';
import 'package:ihealth_monitor/screens/choose%20screen.dart';
import 'package:ihealth_monitor/screens/Doctor/creat%20password.dart';
import 'package:ihealth_monitor/screens/Doctor/forget%20password.dart';
import 'package:ihealth_monitor/screens/Doctor/patients%20list.dart';
import 'package:ihealth_monitor/screens/Doctor/settings.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20in%20doctor.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20up.dart';
import 'package:ihealth_monitor/screens/Doctor/verifyPassword.dart';
import 'package:ihealth_monitor/screens/Patient/Enter_measurements_suger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initializeNotification();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelGroupKey: 'basic_channel_group',
      channelKey: 'basic_channel',
      channelName: 'Basic Notification',
      channelDescription: 'Test notification channel',
    )
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic Group'),
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const IHealthMonitor());
}

class IHealthMonitor extends StatefulWidget {
  const IHealthMonitor({super.key});

  @override
  State<IHealthMonitor> createState() => _IHealthMonitorState();
}

class _IHealthMonitorState extends State<IHealthMonitor> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('----------------------User is currently signed out!');
      } else {
        print('----------------------User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'alata'),
        routes: {
          ChooseScreen.id: (context) => const ChooseScreen(),
          signIn.id: (context) => const signIn(),
          signUp.id: (context) => const signUp(),
          forgetPassword.id: (context) => const forgetPassword(),
          HomeDoctor.id: (context) => const HomeDoctor(),
          // bloodPressure.id: (context) => const bloodPressure(),
          moreBloodPressureDetails.id: (context) =>
              const moreBloodPressureDetails(),
          // DiabeticsScreen.id: (context) => const DiabeticsScreen(),
          moreDeteilsDiabetics.id: (context) => const moreDeteilsDiabetics(),
          AddPatients.id: (context) => const AddPatients(),
          RequestsReceived.id: (context) => const RequestsReceived(),
          SettingsScreen.id: (context) => const SettingsScreen(),
          AccountDetails.id: (context) => const AccountDetails(),
          HomeNavBarDoctor.id: (context) => const HomeNavBarDoctor(),
          verifyPassword.id: (context) => const verifyPassword(),
          creatPassword.id: (context) => const creatPassword(),
          patientsList.id: (context) => const patientsList(),
          signInShadow.id: (context) => const signInShadow(),
          signUpShadow.id: (context) => const signUpShadow(),
          forgetShadow.id: (context) => const forgetShadow(),
          verifyShadow.id: (context) => const verifyShadow(),
          creatShadow.id: (context) => const creatShadow(),
          HomeShadow.id: (context) => const HomeShadow(),
          HomeNavBarShadow.id: (context) => const HomeNavBarShadow(),
          AddPatientsShadow.id: (context) => const AddPatientsShadow(),
          notificationsShadow.id: (context) => const notificationsShadow(),
          SettingsShadow.id: (context) => const SettingsShadow(),
          moreDeteilsShadow.id: (context) => const moreDeteilsShadow(),
          signInPatient.id: (context) => const signInPatient(),
          signUpPatient.id: (context) => const signUpPatient(),
          forgetPatient.id: (context) => const forgetPatient(),
          verifyPatient.id: (context) => const verifyPatient(),
          creatPatient.id: (context) => const creatPatient(),
          AddAddress.id: (context) => const AddAddress(),
          HomePatients.id: (context) => const HomePatients(),
          HomeNavBarPatient.id: (context) => const HomeNavBarPatient(),
          ChooseType.id: (context) => const ChooseType(),
          SelectDateSuger.id: (context) => const SelectDateSuger(),
          EnterMeasurementsPressure.id: (context) =>
              const EnterMeasurementsPressure(),
          EnterMeasurementsSuger.id: (context) =>
              const EnterMeasurementsSuger(),
          PharmacyScreen.id: (context) => const PharmacyScreen(),
          AddFollowers.id: (context) => const AddFollowers(),
          ClinicScreen.id: (context) => const ClinicScreen(),
          SelectDateBlood.id: (context) => const SelectDateBlood(),
          AddDoctors.id: (context) => const AddDoctors(),
          SettingsPatient.id: (context) => const SettingsPatient(),
          Calendar.id: (context) => const Calendar(),
          AddPatientsShadow.id: (context) => const AddPatientsShadow(),
          TestResults.id: (context) => const TestResults(),
          ElEzaby.id: (context) => const ElEzaby(),
          Misr.id: (context) => const Misr(),
          NumbersPharmacy.id: (context) => const NumbersPharmacy(),
          Eltarshouby.id: (context) => const Eltarshouby(),
          LabScreen.id:(context) => const LabScreen(),
          BloodPressurePatients.id:(context) => const BloodPressurePatients(),
          diabeticsPatients.id:(context) => const diabeticsPatients(),
        },
        home: const SplashScreen());
  }
}
