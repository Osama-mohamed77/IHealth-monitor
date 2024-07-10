import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/HomeNav_Bar.dart';
import 'package:ihealth_monitor/components/calender.dart';
import 'package:ihealth_monitor/components/splash_screen.dart';
import 'package:ihealth_monitor/firebase_options.dart';
import 'package:ihealth_monitor/helper/notification_service.dart';
import 'package:ihealth_monitor/helper/notifications.dart';
import 'package:ihealth_monitor/screens/Doctor/Add_doctor.dart';
import 'package:ihealth_monitor/screens/Doctor/list%20of%20Blood/blood_pressure_patients.dart';
import 'package:ihealth_monitor/screens/Doctor/Account%20details.dart';
import 'package:ihealth_monitor/screens/Doctor/list%20of%20Blood/more_blood_details.dart';
import 'package:ihealth_monitor/screens/Doctor/list%20of%20diabetics/Diabetics%20screen.dart';
import 'package:ihealth_monitor/screens/Doctor/list%20of%20diabetics/more_diabetics_deteils.dart';
import 'package:ihealth_monitor/screens/Doctor/Home.dart';
import 'package:ihealth_monitor/screens/Doctor/Requests%20received.dart';
import 'package:ihealth_monitor/screens/Patient/Add%20address.dart';
import 'package:ihealth_monitor/screens/Patient/Requests_received_patient.dart';
import 'package:ihealth_monitor/screens/Patient/histoy.dart';
import 'package:ihealth_monitor/screens/Patient/account_details_patients.dart';
import 'package:ihealth_monitor/screens/Patient/clinic.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/dawy_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/healthy_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/enter_measurements_Pressure.dart';
import 'package:ihealth_monitor/screens/Patient/Measuring%20devices.dart';
import 'package:ihealth_monitor/screens/Patient/choose%20Type.dart';
import 'package:ihealth_monitor/screens/Patient/Forget%20patient.dart';
import 'package:ihealth_monitor/screens/Patient/Home%20Patient.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart';
import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/techno_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/lab/al%20Shams%20_Lab.dart';
import 'package:ihealth_monitor/screens/Patient/lab/nile_lab.dart';
import 'package:ihealth_monitor/screens/Patient/lab/royal_lab.dart';
import 'package:ihealth_monitor/screens/Patient/laboratory.dart';
import 'package:ihealth_monitor/screens/Patient/notifications_patient.dart';
import 'package:ihealth_monitor/screens/Patient/pharmacies/19011.dart';
import 'package:ihealth_monitor/screens/Patient/pharmacies/El_Ezaby.dart';
import 'package:ihealth_monitor/screens/Patient/pharmacies/Eltarshouby.dart';
import 'package:ihealth_monitor/screens/Patient/pharmacies/misr_Pharmacy.dart';
import 'package:ihealth_monitor/screens/Patient/select_date_Pressure.dart';
import 'package:ihealth_monitor/screens/Patient/select_date_sugar.dart';
import 'package:ihealth_monitor/screens/Patient/settings_patient.dart';
import 'package:ihealth_monitor/screens/Patient/sign%20up%20Patient.dart';
import 'package:ihealth_monitor/screens/Patient/test_result.dart';
import 'package:ihealth_monitor/screens/Shadow/Add%20patients%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Forget%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Hom%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Home%20Nav%20Bar.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20in%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20up%20shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/account_details_shadow.dart';
import 'package:ihealth_monitor/screens/Shadow/more_details.dart';
import 'package:ihealth_monitor/screens/Shadow/settings%20shadow.dart';
import 'package:ihealth_monitor/screens/choose%20screen.dart';
import 'package:ihealth_monitor/screens/Doctor/forget%20password.dart';
import 'package:ihealth_monitor/screens/Doctor/patients%20list.dart';
import 'package:ihealth_monitor/screens/Doctor/settings.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20in%20doctor.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20up.dart';
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
  User? currentUser;
  String? userRole;

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
          NotificationController.onDismissActionReceivedMethod,
    );

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        currentUser = user;
      });
      if (user != null) {
        fetchUserRoleAndData(user.uid);
      }
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
    });
  }

  Future<void> fetchUserRoleAndData(String userId) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        userRole = data['role'];
        // Debug print
        if (userRole == 'patient') {
          fetchData();
        } else if (userRole == 'shadow') {
          fetchShadow();
        }
      } else {
        // Debug print
      }
    } catch (e) {
      // Debug print
    }
  }

  Future<void> fetchData() async {
    if (currentUser != null && userRole == 'patient') {
      String userId = currentUser!.uid;
      await fetchPatientData(userId);
    }
  }

  Future<void> fetchPatientData(String userId) async {
    await fetchDataForPatient(userId);
    await fetchApprovalClinic(userId);
    await fetchDeclinedClinic(userId);
    await fetchApprovalPharmacy(userId);
    await fetchApprovalLaboratory(userId);
    await fetchRequests(userId);
  }

  Future<void> fetchDataForPatient(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        var flag = data['flag'];
        if (flag == 'true') {
          NotificationPatient(9, 'Request to visit',
              'You should visit the clinic as soon as possible');
          FirebaseFirestore.instance
              .collection('Patients')
              .doc(userId)
              .update({'flag': 'false'});
        }
      }
    } catch (e) {
      return;
    }
  }

  Future<void> fetchApprovalClinic(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients list')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        var status = documentSnapshot['status'];
        if (status == 'true') {
          NotificationPatient(
              5, 'Clinic Reminder', 'Your request has been approved.');
          FirebaseFirestore.instance
              .collection('Patients list')
              .doc(userId)
              .update({'status': 'false'});
        }
      }
    } catch (e) {
      return;
    }
  }

  Future<void> fetchDeclinedClinic(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('reservation')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        var declined = documentSnapshot['declined'];
        if (declined == true) {
          NotificationPatient(
              5, 'Clinic Reminder', 'Your request has been declined.');
          FirebaseFirestore.instance
              .collection('reservation')
              .doc(userId)
              .update({'declined': false});
        }
      }
    } catch (e) {
      return;
    }
  }

  Future<void> fetchApprovalLaboratory(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('LabPatients')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        var status = documentSnapshot['status'];
        if (status == 'true') {
          NotificationPatient(
              6, 'Laboratory Reminder', 'Your request has been approved.');
          FirebaseFirestore.instance
              .collection('LabPatients')
              .doc(userId)
              .update({'status': 'false'});
        }
      }
    } catch (e) {
      return;
    }
  }

  Future<void> fetchApprovalPharmacy(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('PatientOrders')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        var status = documentSnapshot['status'];
        if (status == 'true') {
          NotificationPatient(
              7, 'Pharmacy Reminder', 'Your request has been approved.');
          FirebaseFirestore.instance
              .collection('PatientOrders')
              .doc(userId)
              .update({'status': 'false'});
        }
      }
    } catch (e) {
      return;
    }
  }

  Future<void> fetchRequests(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('FriendRequests')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        var status = documentSnapshot['status'];
        var senderName = documentSnapshot['senderName'];
        if (status == 'pending') {
          NotificationPatient(9, 'New friend request',
              'You have a new friend request from: $senderName');
          FirebaseFirestore.instance
              .collection('FriendRequests')
              .doc(userId)
              .update({'status': 'sent'});
        }
      }
    } catch (e) {
      return;
    }
  }

  ///shadow

  Future<void> fetchShadow() async {
    if (currentUser != null && userRole == 'shadow') {
      String userId = currentUser!.uid;
      // Debug print
      await fetchDataShadow(userId);
    } else {
      // Debug print
    }
  }

  Future<void> fetchDataShadow(String userId) async {
    // Debug print
    await fetchAcceptedShadow(userId);
  }

  Future<void> fetchAcceptedShadow(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Shadow')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        var friendsStatus = data['friendsStatus'];
        var AcceptorName = data['AcceptorName'];

        // Debug print

        if (friendsStatus == '$userId accepted') {
          await NotificationPatient(9, 'Request Accept',
              'The friend request was accepted by: $AcceptorName');
          await FirebaseFirestore.instance
              .collection('Shadow')
              .doc(userId)
              .update({'friendsStatus': '', 'AcceptorName': ''});
        }
      } else {        // Debug print
      }
    } catch (e) {
      // Debug print
    }
  }

  Future<void> NotificationPatient(int id, String title, String body) async {
    try {
      final notificationContent = NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: body,
      );

      await AwesomeNotifications().createNotification(
        content: notificationContent,
      );

      if (currentUser != null) {
        await NotificationManager.saveNotification(
            currentUser!.uid, id, title, body);
      }
    } catch (e) {
      // Debug print
    }
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
              const MoreBloodPressureDetails(
                patientId: '',
              ),
          MoreDeteilsDiabetics.id: (context) =>
              const MoreDeteilsDiabetics(patientId: ''),
          AddDoctor.id: (context) => const AddDoctor(),
          RequestsReceived.id: (context) => const RequestsReceived(),
          SettingsScreen.id: (context) => const SettingsScreen(),
          AccountDetails.id: (context) => const AccountDetails(),
          HomeNavBarDoctor.id: (context) => const HomeNavBarDoctor(),
          PatientsList.id: (context) => const PatientsList(),
          SignInShadow.id: (context) => const SignInShadow(),
          SignUpShadow.id: (context) => const SignUpShadow(),
          ForgetShadow.id: (context) => const ForgetShadow(),
          HomeShadow.id: (context) => const HomeShadow(),
          HomeNavBarShadow.id: (context) => const HomeNavBarShadow(),
          AddPatientsShadow.id: (context) => const AddPatientsShadow(),
          SettingsShadow.id: (context) => const SettingsShadow(),
          MoreDeteilsShadow.id: (context) => const MoreDeteilsShadow(
                patientId: '',
              ),
          SignInPatient.id: (context) => const SignInPatient(),
          SignUpPatient.id: (context) => const SignUpPatient(),
          ForgetPatient.id: (context) => const ForgetPatient(),
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
          DiabeticsPatients.id: (context) => const DiabeticsPatients(),
          BloodPressure.id: (context) => const BloodPressure(),
          History.id: (context) => const History(),
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
          RequestsReceivedPatient.id: (context) =>
              const RequestsReceivedPatient(),
        },
        home: const SplashScreen());
  }
}
