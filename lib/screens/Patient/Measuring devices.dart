// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class PharmacyModel {
  String? image;
  String? name;
  String? area;
  String? appointments;

  PharmacyModel({
    this.image,
    this.name,
    this.area,
    this.appointments,
  });
}

class PharmacyScreen extends StatefulWidget {
  static String id = 'PharmacyScreen';

  const PharmacyScreen({super.key});
  @override
  _PharmacyScreenState createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  String? selectedArea;
  late List<PharmacyModel> pharmaciesList;
  List<PharmacyModel> filteredPharmacies = [];

  @override
  void initState() {
    super.initState();
    pharmaciesList = [
      PharmacyModel(
        image: 'assets/images/ezapy.png',
        name: 'el ezaby pharmacy',
        area: 'Cairo-al shorouk',
        appointments: '8:00 AM - 12:30 AM',
      ),
      PharmacyModel(
        image: 'assets/images/misr.png',
        name: 'Misr pharmacy',
        area: 'Giza-6th october',
        appointments: '8:00 AM - 12:00 AM',
      ),
      PharmacyModel(
        image: 'assets/images/19011.png',
        name: '19011 pharmacy',
        area: 'Alexandria-miami',
        appointments: '8:00 AM - 12:30 AM',
      ),
      PharmacyModel(
        image: 'assets/images/الطرشوبي.png',
        name: 'Eltarshouby pharmacy',
        area: 'Dakahlia-mansoura',
        appointments: '8:00 AM - 12:30 AM',
      ),
    ];
    filteredPharmacies = List.from(pharmaciesList);
  }

  void _filterPharmacies() {
    if (selectedArea != null) {
      setState(() {
        filteredPharmacies = pharmaciesList
            .where((pharmacy) => pharmacy.area == selectedArea)
            .toList();
      });
    } else {
      setState(() {
        filteredPharmacies = List.from(pharmaciesList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text('Measuring devices'),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedArea,
            hint: const Text('Select Area'),
            onChanged: (String? newValue) {
              setState(() {
                selectedArea = newValue;
                _filterPharmacies();
              });
            },
            items: pharmaciesList
                .map<DropdownMenuItem<String>>((PharmacyModel pharmacy) {
              return DropdownMenuItem<String>(
                value: pharmacy.area,
                child: Text(pharmacy.area!),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPharmacies.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    filteredPharmacies[index].image!,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    filteredPharmacies[index].name!,
                    style: const TextStyle(fontFamily: 'alata', fontSize: 19),
                  ),
                  subtitle: Text(
                    filteredPharmacies[index].appointments!,
                    style: const TextStyle(fontFamily: 'alata', fontSize: 15),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
