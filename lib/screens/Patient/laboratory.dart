import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/dawy_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/healthy_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/clinics/techno_clinic.dart';
import 'package:ihealth_monitor/screens/Patient/lab/al%20Shams%20_Lab.dart';
import 'package:ihealth_monitor/screens/Patient/lab/nile_lab.dart';
import 'package:ihealth_monitor/screens/Patient/lab/royal_lab.dart';

class LabModel {
  String? image;
  String? name;
  String? area;
  String? appointments;

  LabModel({
    this.image,
    this.name,
    this.area,
    this.appointments,
  });
}

class LabScreen extends StatefulWidget {
  static String id = 'LabScreen';
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  String? selectedArea;
  late List<LabModel> LabList;
  List<LabModel> filteredLab = [];

  @override
  void initState() {
    super.initState();
    LabList = [
      LabModel(
        image: 'assets/images/royal.png',
        name: 'Royal lab',
        area: 'Cairo-al shorouk',
        appointments: '9:00 AM - 11:00 PM',
      ),
      LabModel(
        image: 'assets/images/nile.png',
        name: 'Nile lab',
        area: 'Giza-6th october',
        appointments: '9:00 AM - 11:00 PM',
      ),
      LabModel(
        image: 'assets/images/Al Shams.png',
        name: 'Al Shams Lab',
        area: 'Alexandria-miami',
        appointments: '9:00 AM - 11:00 PM',
      ),
    ];
    filteredLab = List.from(LabList);
  }

  void _filterPharmacies() {
    if (selectedArea != null) {
      setState(() {
        filteredLab = LabList.where((Lab) => Lab.area == selectedArea).toList();
      });
    } else {
      setState(() {
        filteredLab = List.from(LabList);
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
            Text('Laboratory'),
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
            items: LabList.map<DropdownMenuItem<String>>((LabModel Lab) {
              return DropdownMenuItem<String>(
                value: Lab.area,
                child: Text(Lab.area!),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLab.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, RoyalScreen.id);
                    }
                    if (index == 1) {
                      Navigator.pushNamed(context, NileScreen.id);
                    }
                    if (index == 2) {
                      Navigator.pushNamed(context, ALShamsScreen.id);
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
                        filteredLab[index].image!,
                        width: 80,
                        height: 80,
                      ),
                      title: Text(
                        filteredLab[index].name!,
                        style:
                            const TextStyle(fontFamily: 'alata', fontSize: 19),
                      ),
                      subtitle: Text(
                        filteredLab[index].appointments!,
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
