
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/Bpmore%20deteils.dart';

class BloodPressure extends StatefulWidget {
  static String id = 'BloodPressure';
  const BloodPressure({super.key});

  @override
  _BloodPressurePatientsState createState() => _BloodPressurePatientsState();
}

class _BloodPressurePatientsState extends State<BloodPressure> {
  List<Map<String, dynamic>> patients = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference patientsRef = firestore.collection('Patients');

    QuerySnapshot querySnapshot = await patientsRef.get();

    patients = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xff92B28F),
        title: const Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text('Blood Pressure Patients'),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> patient = patients[index];

          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MoreBloodPressureDetails.id);
                      },
                      child: Container(
                        width: 322,
                        height: 47,
                        decoration: const BoxDecoration(
                          color: Color(0xffCEDBCD),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0, 4),
                              blurRadius: 2,
                            ),
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0, 4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${patient['FullName']}, ${patient['age']}, ${patient['gender']}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'alata',
                                fontSize: 15,
                              ),
                            ),
                            if (patient['disease'] == 'blood,suger')
                              const Row(
                                children: [
                                  Icon(
                                    Icons.monitor_heart,
                                    color: Color.fromARGB(255, 234, 34, 19),
                                  ),
                                  Icon(
                                    Icons.bloodtype,
                                    color: Color.fromARGB(255, 234, 34, 19),
                                  ),
                                ],
                              ),
                            if (patient['disease'] == 'blood')
                              const Icon(
                                Icons.monitor_heart,
                                color: Color.fromARGB(255, 234, 34, 19),
                              ),
                            const Expanded(
                              child: SizedBox(
                                width: 20,
                              ),
                            ),
                            const Icon(
                              Icons.error_outline_sharp,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}



// ListTile(
//             title: Text(patient['FullName']),
//             subtitle: Text('${patient['age']} ${patient['gender']}'),
//           );