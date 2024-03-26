// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/pharmacy.dart';

class measuringDevices extends StatefulWidget {
  
  const measuringDevices({super.key});
  static String id = 'measuringDevices';
  @override
  State<measuringDevices> createState() => _measuringDevicesState();
}

class _measuringDevicesState extends State<measuringDevices> {
  List<pharmacyModel> pharmacies = [
    const pharmacyModel(
      image: 'assets/images/ezapy.png',
      name: 'el ezaby pharmacy',
      area: 'Cairo-al shorouk',
      appointments: '8:00 AM - 12:30 AM',
    ),
    const pharmacyModel(
      image: 'assets/images/misr.png',
      name: '    Misr pharmacy',
      area: '    Giza-6th october',
      appointments: '     8:00 AM - 12:00 AM',
    ),
    const pharmacyModel(
      image: 'assets/images/19011.png',
      name: '  19011 pharmacy',
      area: '    Alexandria-miami',
      appointments: '  8:00 AM - 12:30 AM',
    ),
    const pharmacyModel(
      image: 'assets/images/الطرشوبي.png',
      name: 'Eltarshouby pharmacy',
      area: 'Dakahlia-mansoura',
      appointments: '8:00 AM - 12:30 AM',
    ),
  ];
  String? selectedPharmacy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              const Text('Select the area',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 20,
                    color: Colors.black,
                  )),
              DropdownButton<String>(
                value: selectedPharmacy,
                hint: const Text('Select a pharmacy'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPharmacy = newValue;
                  });
                },
                items: widget..map((pharmacyModel pharmacy) {
                  return DropdownMenuItem<String>(
                      value: pharmacy.name,
                      child: Column(
                        children: [pharmacy],
                      ));
                }).toList(),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pharmacies.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [pharmacies[index]],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
