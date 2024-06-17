import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/HomeNav_Bar.dart';
import 'package:ihealth_monitor/components/calender.dart';
import 'package:ihealth_monitor/components/splash_screen.dart';
import 'package:ihealth_monitor/firebase_options.dart';
import 'package:ihealth_monitor/helper/notification_service.dart';
import 'package:ihealth_monitor/helper/notifications.dart';
import 'package:ihealth_monitor/screens/Doctor/Add_doctor.dart';
import 'package:ihealth_monitor/screens/Doctor/blood_pressure_patients.dart';
import 'package:ihealth_monitor/screens/Doctor/Account%20details.dart';
import 'package:ihealth_monitor/screens/Doctor/Diabetics%20screen.dart';
import 'package:ihealth_monitor/screens/Doctor/Bpmore%20deteils.dart';
import 'package:ihealth_monitor/screens/Doctor/Dpmore%20deteils.dart';
import 'package:ihealth_monitor/screens/Doctor/Home.dart';
import 'package:ihealth_monitor/screens/Doctor/Requests%20received.dart';
import 'package:ihealth_monitor/screens/Patient/Add%20address.dart';
import 'package:ihealth_monitor/screens/Patient/Booking_date.dart';
import 'package:ihealth_monitor/screens/Patient/account_details_patients.dart';
import 'package:ihealth_monitor/screens/Patient/clinic.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/dawy_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/healthy_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/enter_measurements_Pressure.dart';
import 'package:ihealth_monitor/screens/Patient/Measuring%20devices.dart';
import 'package:ihealth_monitor/screens/Patient/add_Followers.dart';
import 'package:ihealth_monitor/screens/Patient/choose%20Type.dart';
import 'package:ihealth_monitor/screens/Patient/Forget%20patient.dart';
import 'package:ihealth_monitor/screens/Patient/Home%20Patient.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart';
import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/techno_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/creat%20patient.dart';
import 'package:ihealth_monitor/screens/Patient/lab/al%20Shams%20_Lab.dart';
import 'package:ihealth_monitor/screens/Patient/lab/nile_lab.dart';
import 'package:ihealth_monitor/screens/Patient/lab/royal_lab.dart';
import 'package:ihealth_monitor/screens/Patient/laboratory.dart';
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
import 'package:ihealth_monitor/screens/Shadow/account_details_shadow.dart';
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const IHealthMonitor());
}

class IHealthMonitor extends StatefulWidget {
  const IHealthMonitor({super.key});

  @override
  State<IHealthMonitor> createState() => _IHealthMonitorState();
}

class _IHealthMonitorState extends State<IHealthMonitor> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startPeriodicFetch();

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
      } else {}
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startPeriodicFetch() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchData();
      fetchApprovalClinic();
      fetchApprovalLaboratory();
      fetchApprovalPharmacy();
      fetchDeclinedClinic();
    });
  }

  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        var flag = data['flag'];
        if (flag != null) {}

        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user != null && user.uid == 'AKut52R1LzdDvBQfJAzJLEsQCsq2') {
            if (flag == 'true') {
              Notification(9, 'Request to visit',
                  'You should visit the clinic as soon as possible');
              FirebaseFirestore.instance
                  .collection('Patients')
                  .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
                  .update({'flag': 'false'});
            }
          }
        });
      }
    } catch (e) {
      return;
    }
  }

//clinic Approval
  Future<void> fetchApprovalClinic() async {
    String status = '';
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients list')
          .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          status = documentSnapshot['status'];
        });
      }
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null && user.uid == 'AKut52R1LzdDvBQfJAzJLEsQCsq2') {
          if (status == 'true') {
            Notification(
                5, 'Clinic Reminder', 'Your request has been approved.');
            FirebaseFirestore.instance
                .collection('Patients list')
                .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
                .update({'status': 'false'});
          }
        }
      });
    } catch (e) {
      return;
    }
  }

  //clinic Declined
  Future<void> fetchDeclinedClinic() async {
    bool? declined;
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('reservation')
          .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          declined = documentSnapshot['declined'];
        });
      }
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null && user.uid == 'AKut52R1LzdDvBQfJAzJLEsQCsq2') {
          if (declined == true) {
            Notification(
                5, 'Clinic Reminder', 'Your request has been declined.');
            FirebaseFirestore.instance
                .collection('reservation')
                .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
                .update({'declined': false});
          }
        }
      });
    } catch (e) {
      return;
    }
  }

//Laboratory
  Future<void> fetchApprovalLaboratory() async {
    String status = '';
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('LabPatients')
          .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          status = documentSnapshot['status'];
        });
      }
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null && user.uid == 'AKut52R1LzdDvBQfJAzJLEsQCsq2') {
          if (status == 'true') {
            Notification(
                6, 'Laboratory Reminder', 'Your request has been approved.');
            FirebaseFirestore.instance
                .collection('LabPatients')
                .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
                .update({'status': 'false'});
          }
        }
      });
    } catch (e) {
      return;
    }
  }

  //Pharmacy
  Future<void> fetchApprovalPharmacy() async {
    String status = '';
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('PatientOrders')
          .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          status = documentSnapshot['status'];
        });
      }
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null && user.uid == 'AKut52R1LzdDvBQfJAzJLEsQCsq2') {
          if (status == 'true') {
            Notification(
                7, 'pharmacy Reminder', 'Your request has been approved.');
            FirebaseFirestore.instance
                .collection('PatientOrders')
                .doc('AKut52R1LzdDvBQfJAzJLEsQCsq2')
                .update({'status': 'false'});
          }
        }
      });
    } catch (e) {
      return;
    }
  }

  Future<void> Notification(int id, String title, String body) async {
    final notificationContent = NotificationContent(
      id: id,
      channelKey: 'basic_channel',
      title: title,
      body: body,
    );

    await AwesomeNotifications().createNotification(
      content: notificationContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'alata'),
        routes: {
          ChooseScreen.id: (context) => const ChooseScreen(),
          SignIn.id: (context) => const SignIn(),
          SignUp.id: (context) => const SignUp(),
          ForgetPassword.id: (context) => const ForgetPassword(),
          HomeDoctor.id: (context) => const HomeDoctor(),
          MoreBloodPressureDetails.id: (context) =>
              const MoreBloodPressureDetails(),
          MoreDeteilsDiabetics.id: (context) => const MoreDeteilsDiabetics(),
          AddDoctor.id: (context) => const AddDoctor(),
          RequestsReceived.id: (context) => const RequestsReceived(),
          SettingsScreen.id: (context) => const SettingsScreen(),
          AccountDetails.id: (context) => const AccountDetails(),
          HomeNavBarDoctor.id: (context) => const HomeNavBarDoctor(),
          VerifyPassword.id: (context) => const VerifyPassword(),
          CreatPassword.id: (context) => const CreatPassword(),
          PatientsList.id: (context) => const PatientsList(),
          SignInShadow.id: (context) => const SignInShadow(),
          SignUpShadow.id: (context) => const SignUpShadow(),
          ForgetShadow.id: (context) => const ForgetShadow(),
          VerifyShadow.id: (context) => const VerifyShadow(),
          CreatShadow.id: (context) => const CreatShadow(),
          HomeShadow.id: (context) => const HomeShadow(),
          HomeNavBarShadow.id: (context) => const HomeNavBarShadow(),
          AddPatientsShadow.id: (context) => const AddPatientsShadow(),
          NotificationsShadow.id: (context) => const NotificationsShadow(),
          SettingsShadow.id: (context) => const SettingsShadow(),
          MoreDeteilsShadow.id: (context) => const MoreDeteilsShadow(),
          SignInPatient.id: (context) => const SignInPatient(),
          SignUpPatient.id: (context) => const SignUpPatient(),
          ForgetPatient.id: (context) => const ForgetPatient(),
          VerifyPatient.id: (context) => const VerifyPatient(),
          CreatPatient.id: (context) => const CreatPatient(),
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
          SelectDateBlood.id: (context) => const SelectDateBlood(),
          AddDoctor.id: (context) => const AddDoctor(),
          SettingsPatient.id: (context) => const SettingsPatient(),
          Calendar.id: (context) => const Calendar(),
          AddPatientsShadow.id: (context) => const AddPatientsShadow(),
          TestResults.id: (context) => const TestResults(),
          ElEzaby.id: (context) => const ElEzaby(),
          Misr.id: (context) => const Misr(),
          NumbersPharmacy.id: (context) => const NumbersPharmacy(),
          Eltarshouby.id: (context) => const Eltarshouby(),
          RoyalScreen.id: (context) => const RoyalScreen(),
          BloodPressure.id: (context) => const BloodPressure(),
          DiabeticsPatients.id: (context) => const DiabeticsPatients(),
          BookingDate.id: (context) => const BookingDate(),
          ClinicScreen.id: (context) => const ClinicScreen(),
          HealthyClinic.id: (context) => const HealthyClinic(),
          TechnoClinic.id: (context) => const TechnoClinic(),
          DawyClinic.id: (context) => const DawyClinic(),
          LabScreen.id: (context) => const LabScreen(),
          NileScreen.id: (context) => const NileScreen(),
          ALShamsScreen.id: (context) => const ALShamsScreen(),
          RoyalScreen.id: (context) => const RoyalScreen(),
          AccountDetailsShadow.id: (context) => const AccountDetailsShadow(),
          AccountDetailsPatient.id: (context) => const AccountDetailsPatient(),
          AddFollowers.id: (context) => const AddFollowers(),
        },
        home: const SplashScreen());
  }
}
