// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/HomeNav_Bar.dart';
import 'package:ihealth_monitor/components/splash_screen.dart';
import 'package:ihealth_monitor/firebase_options.dart';
import 'package:ihealth_monitor/screens/Doctor/Account%20details.dart';
import 'package:ihealth_monitor/screens/Doctor/Add%20patients.dart';
import 'package:ihealth_monitor/screens/Doctor/Blood%20pressure%20patients.dart';
import 'package:ihealth_monitor/screens/Doctor/Diabetics%20screen.dart';
import 'package:ihealth_monitor/screens/Doctor/Bpmore%20deteils.dart';
import 'package:ihealth_monitor/screens/Doctor/Dpmore%20deteils.dart';
import 'package:ihealth_monitor/screens/Doctor/Home.dart';
import 'package:ihealth_monitor/screens/Doctor/Requests%20received.dart';
import 'package:ihealth_monitor/screens/Patient/Add%20address.dart';
import 'package:ihealth_monitor/screens/Patient/Enter%20measurements.dart';
import 'package:ihealth_monitor/screens/Patient/Measuring%20devices.dart';
import 'package:ihealth_monitor/screens/Patient/add_Followers.dart';
import 'package:ihealth_monitor/screens/Patient/choose%20Type.dart';
import 'package:ihealth_monitor/screens/Patient/Forget%20patient.dart';
import 'package:ihealth_monitor/screens/Patient/Home%20Patient.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart';
import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
import 'package:ihealth_monitor/screens/Patient/clinic.dart';
import 'package:ihealth_monitor/screens/Patient/creat%20patient.dart';
import 'package:ihealth_monitor/screens/Patient/select%20date.dart';
import 'package:ihealth_monitor/screens/Patient/sign%20up%20Patient.dart';
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
import 'package:ihealth_monitor/screens/Doctor/notifications.dart';
import 'package:ihealth_monitor/screens/Doctor/patients%20list.dart';
import 'package:ihealth_monitor/screens/Doctor/settings.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20in%20doctor.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20up.dart';
import 'package:ihealth_monitor/screens/Doctor/verifyPassword.dart';

void main() async {
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
        theme: ThemeData(fontFamily: 'alata'
        
        
        ),
        
        routes: {
          ChooseScreen.id: (context) => const ChooseScreen(),
          signIn.id: (context) => const signIn(),
          signUp.id: (context) => const signUp(),
          forgetPassword.id: (context) => const forgetPassword(),
          HomeDoctor.id: (context) => const HomeDoctor(),
          bloodPressure.id: (context) => const bloodPressure(),
          moreBloodPressureDetails.id: (context) =>
              const moreBloodPressureDetails(),
          DiabeticsScreen.id: (context) => const DiabeticsScreen(),
          moreDeteilsDiabetics.id: (context) => const moreDeteilsDiabetics(),
          AddPatients.id: (context) => const AddPatients(),
          RequestsReceived.id: (context) => const RequestsReceived(),
          SettingsScreen.id: (context) => const SettingsScreen(),
          AccountDetails.id: (context) => const AccountDetails(),
          HomeNavBarDoctor.id: (context) => const HomeNavBarDoctor(),
          notifications.id: (context) => const notifications(),
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
          SelectDate.id: (context) => const SelectDate(),
          EnterMeasurements.id: (context) => const EnterMeasurements(),
          PharmacyScreen.id: (context) => const PharmacyScreen(),
          AddFollowers.id: (context) =>  const AddFollowers(),
          ClinicScreen.id:(context) => const ClinicScreen(),
         
        },
        home: const SplashScreen());
  }
}
