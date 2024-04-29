// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MoreClass {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> addUser(
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
        .collection('Address')
        .add({
          'Area': area,
          'Street Name': streetName,
          'Building Name': buildingName,
          'Floor Number': floorNumber,
          'Apartment Number': apartmentNumber,
          'Landline Number': landlineNumber,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addFirstMeasurement({required String firstMeasurement}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
          '${DateTime.now().day}': [firstMeasurement],
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addSecondMeasurement({required String secondMeasurement}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Measurement')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'secound': secondMeasurement})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> datesMeasurement(
      {required String firstTime, required String secondTime}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Measurement dates')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
          'The first date for entering measurements': firstTime,
          'The second date for entering measurements': secondTime,
        })
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
      return MoreClass().addUser(
          fullname: fullname,
          userName: userName,
          age: age,
          phoneNumer: phoneNumer,
          email: email,
          gender: gender);
    });
  }

  Future<void> bookingTime(
      {required String bookingTime, required String bookingDate,
      required String doctorName
  }) async {
    await _fireStore.collection('reservation').doc(_auth.currentUser!.uid).set({
      'id': _auth.currentUser!.uid,
      'time': bookingTime,
      'bookingDate': bookingDate,
      'doctorName': doctorName,
      
    });
  }
}
