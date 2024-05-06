// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ihealth_monitor/helper/measurement_model.dart';
import 'package:ihealth_monitor/helper/userProfile.dart';
import 'package:intl/intl.dart';

class MoreClass {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  // final today =
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final today = DateFormat('yyy,M,d').format(DateTime.now());

  Future<void> addPatient(
      {required String fullname,
      required String userName,
      required String age,
      required String phoneNumer,
      required String email,
      required String gender}) async {
    await _fireStore
        .collection('Patients')
        .doc(_auth.currentUser!.uid)
        .set({
          'id': _auth.currentUser!.uid,
          'FullName': fullname,
          'userName': userName,
          'age': age,
          'phoneNumber': phoneNumer,
          'email': email,
          'gender': gender,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addAddress(
      {required String area,
      required String streetName,
      required String buildingName,
      required String floorNumber,
      required String apartmentNumber,
      required String landlineNumber}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
          'Area': area,
          'StreetName': streetName,
          'BuildingName': buildingName,
          'FloorNumber': floorNumber,
          'ApartmentNumber': apartmentNumber,
          'LandlineNumber': landlineNumber,
        })
        .whenComplete(() => UserProfile().getPatienProfile())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  ////Suger

  Future<void> firstMeasurementSuger({required String firstMeasurement}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc(today.toString())
        .set({
          'first': firstMeasurement,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> secondMeasurementSuger(
      {required String secondMeasurement}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc(today.toString())
        .update({'secound': secondMeasurement})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> datesMeasurementSuger(
      {required String firstTime, required String secondTime}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .set({
          'The first date for entering measurements': firstTime,
          'The second date for entering measurements': secondTime,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  ////Pressure

  Future<void> datesMeasurementPressure({required String firstTime}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .set({
          'date measurements': firstTime,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> measurementPressure({required String firstMeasurement}) async {
    Measurementmodel measurementmodel =
        Measurementmodel(date: today, measurement: firstMeasurement);
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc(today)
        .set(measurementmodel.toMap())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> signUpUser({
    required String email,
    required String password,
    required String fullname,
    required String userName,
    required String age,
    required String phoneNumer,
    required String gender,
  }) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() {
      return MoreClass().addPatient(
          fullname: fullname,
          userName: userName,
          age: age,
          phoneNumer: phoneNumer,
          email: email,
          gender: gender);
    });
  }

  Future<void> bookingTime({
    required String bookingTime,
    required String bookingDate,
    required String doctorName,
    required String fullname,
    required String age,
    required String email,
    required String userName,
    required String phoneNumber,
    required String gender,
    required String area,
    required String streetName,
    required String apartmentNumber,
    required String buildingName,
    required String floorNumber,
    required String landlineNumber,
  }) async {
    await _fireStore.collection('reservation').doc(_auth.currentUser!.uid).set({
      'id': _auth.currentUser!.uid,
      'time': bookingTime,
      'bookingDate': bookingDate,
      'doctorName': doctorName,
      'FullName': fullname,
      'age': age,
      'email': email,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'Area': area,
      'StreetName': streetName,
      'ApartmentNumber': apartmentNumber,
      'BuildingName': buildingName,
      'FloorNumber': floorNumber,
      'LandlineNumber': landlineNumber,
    });
  }

  ///// doctor

  Future<void> addDoctor({
    required String fullname,
    required String userName,
    required String phoneNumer,
    required String email,
  }) async {
    await _fireStore
        .collection('Doctors')
        .doc(_auth.currentUser!.uid)
        .set({
          'id': _auth.currentUser!.uid,
          'FullName': fullname,
          'userName': userName,
          'phoneNumber': phoneNumer,
          'email': email,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> signUpDoctor({
    required String email,
    required String password,
    required String fullname,
    required String userName,
    required String phoneNumer,
  }) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() {
      return MoreClass().addDoctor(
        fullname: fullname,
        userName: userName,
        phoneNumer: phoneNumer,
        email: email,
      );
    });
  }
}









// Future<void> addFirstMeasurement({required String firstMeasurement}) async {
//   await _fireStore
//       .collection('Patients')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('Measurement')
//       .doc(
//           '${DateTime.now().day.toString()} /${DateTime.now().month.toString()}')
//       .set({
//         '${DateTime.now().day}': firstMeasurement,
//       })
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
// }
