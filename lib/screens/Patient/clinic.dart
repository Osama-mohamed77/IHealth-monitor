import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/dawy_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/healthy_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/techno_clinic.dart';

class ClinicModel {
  String? image;
  String? name;
  String? area;
  String? appointments;

  ClinicModel({
    this.image,
    this.name,
    this.area,
    this.appointments,
  });
}

class ClinicScreen extends StatefulWidget {
  static String id = 'ClinicScreen';
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  String? selectedArea;
  late List<ClinicModel> ClinicsList;
  List<ClinicModel> filteredClinics = [];

  @override
  void initState() {
    super.initState();
    ClinicsList = [
      ClinicModel(
        image: 'assets/images/techno.jpg',
        name: 'Techno clinic',
        area: 'Cairo-al shorouk',
        appointments: '9:00 AM - 7:00 PM',
      ),
      ClinicModel(
        image: 'assets/images/dawy.jpg',
        name: 'Dawy clinic',
        area: 'Giza-6th october',
        appointments: '9:00 AM - 7:00 PM',
      ),
      ClinicModel(
        image: 'assets/images/helthy.png',
        name: 'Healthy house Clinic',
        area: 'Alexandria-miami',
        appointments: '9:00 AM - 7:00 PM',
      ),
    ];
    filteredClinics = List.from(ClinicsList);
  }

  void _filterPharmacies() {
    if (selectedArea != null) {
      setState(() {
        filteredClinics =
            ClinicsList.where((clinics) => clinics.area == selectedArea)
                .toList();
      });
    } else {
      setState(() {
        filteredClinics = List.from(ClinicsList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff69B5AB),
        title: const Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              'Clinic',
              style: TextStyle(fontSize: 30),
            ),
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
            items: ClinicsList.map<DropdownMenuItem<String>>(
                (ClinicModel clinics) {
              return DropdownMenuItem<String>(
                value: clinics.area,
                child: Text(clinics.area!),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredClinics.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, TechnoClinic.id);
                    }
                    if (index == 1) {
                      Navigator.pushNamed(context, DawyClinic.id);
                    }
                    if (index == 2) {
                      Navigator.pushNamed(context, HealthyClinic.id);
                    }
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(border: Border.all()),
                    height: 100,
                    width: 300,
                    child: ListTile(
                      leading: Image.asset(
                        filteredClinics[index].image!,
                        width: 70,
                        height: 70,
                      ),
                      title: Text(
                        filteredClinics[index].name!,
                        style:
                            const TextStyle(fontFamily: 'alata', fontSize: 19),
                      ),
                      subtitle: Text(
                        filteredClinics[index].appointments!,
                        style:
                            const TextStyle(fontFamily: 'alata', fontSize: 15),
                      ),
                    ),
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
