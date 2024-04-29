// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: must_be_immutable, file_names

import 'dart:convert';

import 'package:flutter/material.dart';

class  PinTextFromFaild extends StatelessWidget {
  final String labelText;
  Function(String) onChange;
   PinTextFromFaild({super.key,  required this.labelText, required this.onChange});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        onChanged: onChange,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white70,
            labelText: labelText),
      ),
    );
  }
}

class Farmacy {
  String? name;
  String? id;
  Farmacy({
    this.name,
    this.id,
  });

 
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory Farmacy.fromMap(Map<String, dynamic> map) {
    return Farmacy(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  
}
