// ignore_for_file: non_constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ihealth_monitor/screens/Patient/patient_const.dart';

class UserProfile {
  PatientModel patientModel = PatientModel();

  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<PatientModel> getPatienProfile() async {
    final result = await _fireStore
        .collection('Patients')
        .doc(_auth.currentUser!.uid)
        .get();

    final patient = PatientModel.fromMap(result.data()!);
    PatientConst.name = patient.FullName!;
    PatientConst.age = patient.age!;
    PatientConst.email = patient.email!;
    PatientConst.userName = patient.userName!;
    PatientConst.phoneNumber = patient.phoneNumber!;
    PatientConst.gender = patient.gender!;
    PatientConst.id = patient.id!;
   

    patientModel = patient;

    return patient;
  }
}

class PatientModel {
  String? FullName;
  String? userName;
  String? age;
  String? phoneNumber;
  String? email;
  String? gender;
  String? id;

  PatientModel(
      {this.FullName,
      this.userName,
      this.age,
      this.phoneNumber,
      this.email,
      this.gender,
      this.id,
     });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'FullName': FullName,
      'userName': userName,
      'age': age,
      'phoneNumer': phoneNumber,
      'email': email,
      'gender': gender,
      'id': id,
      
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      FullName: map['FullName'] != null ? map['FullName'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
     
    );
  }
}












///////////

class UserAddress {
  AddressModel adreessModel = AddressModel();

  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<AddressModel> getPatienAddress() async {
    final result = await _fireStore
        .collection('Patients')
        .doc(_auth.currentUser!.uid)
        .get();

    final address = AddressModel.fromMap(result.data()!);
   
    AddressConst.Area = address.Area!;
    AddressConst.StreetName = address.StreetName!;
    AddressConst.ApartmentNumber = address.ApartmentNumber!;
    AddressConst.BuildingName = address.BuildingName!;
    AddressConst.FloorNumber = address.FloorNumber!;
    AddressConst.LandlineNumber = address.LandlineNumber!;

    adreessModel = address;

    return address;
  }
}





class AddressModel {
  
  String? Area;
  String? StreetName;
  String? ApartmentNumber;
  String? BuildingName;
  String? FloorNumber;
  String? LandlineNumber;
  AddressModel(
      {
      this.Area,
      this.StreetName,
      this.ApartmentNumber,
      this.BuildingName,
      this.FloorNumber,
      this.LandlineNumber});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      
      'Area': Area,
      'StreetName': StreetName,
      'ApartmentNumber': ApartmentNumber,
      'BuildingName': BuildingName,
      'FloorNumber': FloorNumber,
      'LandlineNumber': LandlineNumber
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      
      Area: map['Area'] != null ? map['Area'] as String : null,
      StreetName:
          map['StreetName'] != null ? map['StreetName'] as String : null,
      ApartmentNumber: map['ApartmentNumber'] != null
          ? map['ApartmentNumber'] as String
          : null,
      BuildingName:
          map['BuildingName'] != null ? map['BuildingName'] as String : null,
      FloorNumber:
          map['FloorNumber'] != null ? map['FloorNumber'] as String : null,
      LandlineNumber: map['LandlineNumber'] != null
          ? map['LandlineNumber'] as String
          : null,
    );
  }
}
