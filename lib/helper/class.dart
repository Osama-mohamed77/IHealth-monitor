// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ihealth_monitor/helper/measurement_model.dart';
import 'package:ihealth_monitor/helper/userProfile.dart';
import 'package:intl/intl.dart';

class MoreClass {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final today = DateFormat('yyyy,M,d').format(DateTime.now());

  Future<void> addPatient({
    required String fullname,
    required String userName,
    required String age,
    required String phoneNumer,
    required String email,
    required String gender,
  }) async {
    await _fireStore.collection('Patients').doc(_auth.currentUser!.uid).set({
      'id': _auth.currentUser!.uid,
      'FullName': fullname,
      'userName': userName,
      'age': age,
      'phoneNumber': phoneNumer,
      'email': email,
      'gender': gender,
      'disease': 'blood,suger'
    }).catchError((error) => null);
  }

  Future<void> addAddress({
    required String area,
    required String streetName,
    required String buildingName,
    required String floorNumber,
    required String apartmentNumber,
    required String landlineNumber,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final docRef = _fireStore.collection('Patients').doc(user.uid);
        final docSnapshot = await docRef.get();
        if (docSnapshot.exists) {
          await docRef.update({
            'Area': area,
            'StreetName': streetName,
            'BuildingName': buildingName,
            'FloorNumber': floorNumber,
            'ApartmentNumber': apartmentNumber,
            'LandlineNumber': landlineNumber,
          });
        } else {
          await docRef.set({
            'Area': area,
            'StreetName': streetName,
            'BuildingName': buildingName,
            'FloorNumber': floorNumber,
            'ApartmentNumber': apartmentNumber,
            'LandlineNumber': landlineNumber,
          });
        }
        // Ensure UserProfile is correctly initialized
        await UserProfile().getPatienProfile();
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'User is not authenticated.',
        );
      }
    } catch (e) {
      print('Error adding address: $e');
      rethrow;
    }
  }

  ////Suger

  Future<void> firstMeasurementSuger({required int firstMeasurement}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc(today.toString())
        .set({
      'first': firstMeasurement,
    }).catchError((error) => null);
  }

  Future<void> secondMeasurementSuger({required int secondMeasurement}) async {
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Sugar Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc(today.toString())
        .update({
      'secound': secondMeasurement,
    }).catchError((error) => null);
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
    }).catchError((error) => null);
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
    }).catchError((error) => null);
  }

  Future<void> measurementPressure({required String Measurement}) async {
    Measurementmodel measurementmodel =
        Measurementmodel(date: today, measurement: Measurement);
    await _fireStore
        .collection('Patients')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Pressure Measurement')
        .doc('measurements dates')
        .collection('measurements')
        .doc(today)
        .set(measurementmodel.toMap())
        .catchError((error) => null);
  }

  Future<void> signUpPatients({
    required String email,
    required String password,
    required String fullname,
    required String userName,
    required String age,
    required String phoneNumer,
    required String gender,
    required String token,
  }) async {
    try {
      // Create the user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        String userId = user.uid;

        // Add the patient details to a dedicated patients collection
        await addPatient(
          fullname: fullname,
          userName: userName,
          age: age,
          phoneNumer: phoneNumer,
          email: email,
          gender: gender,
        );

        // Set the user's role to 'patient' in the Users collection
        await FirebaseFirestore.instance.collection('Users').doc(userId).set({
          'email': email,
          'role': 'patient',
          'fullname': fullname,
          'userName': userName,
          'age': age,
          'phoneNumer': phoneNumer,
          'gender': gender,
          'token': token,
          'id': userId
        });
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          print('The email address is already in use by another account.');
          // Handle accordingly, e.g., show a message to the user
        } else {
          print('Error creating user: ${e.message}');
          // Handle other FirebaseAuthException errors
        }
      } else {
        print('Error: $e');
        // Handle other unexpected errors
      }
    }
  }

  Future<void> bookingClinic(
      {required String bookingTime,
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
      required String doctorID,
      required String clinicName,
      required String status}) async {
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
      'doctorID': doctorID,
      'Clinic name': clinicName,
      'status': status
    });
  }

  Future<void> sendBookingToPatient({
    required String bookingTime,
    required String bookingDate,
    required String doctorName,
    required String doctorID,
  }) async {
    await _fireStore.collection('Patients').doc(_auth.currentUser!.uid).update({
      'time': bookingTime,
      'bookingDate': bookingDate,
      'doctorName': doctorName,
      'doctorID': doctorID,
    });
  }

  Future<void> orderDevice(
      {required String fullname,
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
      required String date,
      required String pharmacyName,
      required String deviceType,
      required String status}) async {
    await _fireStore.collection('OrderList').doc(_auth.currentUser!.uid).set({
      'id': _auth.currentUser!.uid,
      'pharmacyName': pharmacyName,
      'Date': date,
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
      'status': status,
      'deviceType': deviceType,
    });
  }

  Future<void> bookingLab(
      {required String bookingTime,
      required String bookingDate,
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
      required String labName,
      required String status}) async {
    await _fireStore
        .collection('reservation lab')
        .doc(_auth.currentUser!.uid)
        .set({
      'id': _auth.currentUser!.uid,
      'time': bookingTime,
      'bookingDate': bookingDate,
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
      'Lab name': labName,
      'status': status
    });
  }

  ///// doctor

  Future<bool> usernameExists(String userName) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('Users') // Query the 'Users' collection
          .where('userName', isEqualTo: userName)
          .get();
      return result.docs.isNotEmpty;
    } catch (e) {
      print('Error checking username existence: $e');
      return false; // Handle or propagate the error as needed
    }
  }

  Future<void> addDoctor({
    required String fullname,
    required String userName,
    required String phoneNumer,
    required String email,
    required String clinicName,
  }) async {
    await _fireStore.collection('Doctors').doc(_auth.currentUser!.uid).set({
      'id': _auth.currentUser!.uid,
      'FullName': fullname,
      'userName': userName,
      'phoneNumber': phoneNumer,
      'email': email,
      'Clinic name':clinicName
    }).catchError((error) => null);
  }

  Future<void> signUpDoctor({
    required String clinicName,
    required String email,
    required String password,
    required String fullname,
    required String userName,
    required String phoneNumer,
  }) async {
    try {
      bool usernameTaken = await MoreClass().usernameExists(userName);
      if (usernameTaken) {
        print('The username is already taken.');
        // Handle accordingly, e.g., show a message to the user
      } else {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        User? user = userCredential.user;
        if (user != null) {
          String userId = user.uid;

          // Add the doctor details
          await MoreClass().addDoctor(
            fullname: fullname,
            userName: userName,
            phoneNumer: phoneNumer,
            email: email,
            clinicName: clinicName
          );

          // Set the user's role to 'doctor' in Firestore
          await FirebaseFirestore.instance.collection('Users').doc(userId).set({
            'email': email,
            'role': 'doctor',
            'fullname': fullname,
            'userName': userName,
            'phoneNumer': phoneNumer,
            'id': userId,
            'Clinic name': clinicName
          });
        }
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          print('The email address is already in use by another account.');
          // Handle accordingly, e.g., show a message to the user
        } else {
          print('Error creating user: ${e.message}');
          // Handle other FirebaseAuthException errors
        }
      } else {
        print('Error: $e');
        // Handle other unexpected errors
      }
    }
  }

  //shadow

  Future<void> addShadow({
    required String fullname,
    required String userName,
    required String phoneNumer,
    required String email,
  }) async {
    await _fireStore.collection('Shadow').doc(_auth.currentUser!.uid).set({
      'id': _auth.currentUser!.uid,
      'FullName': fullname,
      'userName': userName,
      'phoneNumber': phoneNumer,
      'email': email,
    }).catchError((error) => null);
  }

  Future<void> signUpShadow({
    required String email,
    required String password,
    required String fullname,
    required String userName,
    required String phoneNumer,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    if (user != null) {
      String userId = user.uid;

      // Add the shadow user details
      await MoreClass().addShadow(
        fullname: fullname,
        userName: userName,
        phoneNumer: phoneNumer,
        email: email,
      );

      // Set the user's role to 'shadow' in Firestore
      await FirebaseFirestore.instance.collection('Users').doc(userId).set({
        'email': email,
        'role': 'shadow',
        'fullname': fullname,
        'userName': userName,
        'phoneNumer': phoneNumer,
        'id': userId
      });
    }
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
//       .catchError((error) =>  
// }
