// ignore_for_file: camel_case_types, file_names, unused_local_variable, use_build_context_synchronously, must_be_immutable, non_constant_identifier_names, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:ihealth_monitor/helper/class.dart';
import 'package:ihealth_monitor/helper/userProfile.dart';
import 'package:ihealth_monitor/screens/Patient/HomeNav_Bar_patient.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({
    super.key,
  });
  static String id = 'AddAddress';

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  bool isLoading = false;

  static RegExp nameRegExp = RegExp('[a-zA-Z]');
  static RegExp numberRegExp = RegExp('[0-9]');
  static RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9]+$');
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController area = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController buildingName = TextEditingController();
  TextEditingController floorNumber = TextEditingController();
  TextEditingController apartmentNumber = TextEditingController();
  TextEditingController landlineNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: GradientAppBar(
          automaticallyImplyLeading: false,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add address',
                style: TextStyle(fontFamily: 'alata', fontSize: 25),
              ),
            ],
          ),
          gradient: const LinearGradient(
            colors: [Color(0xff92B28F), Color(0xff69B5AB), Color(0xffA9A360)],
          ),
        ),
        backgroundColor: const Color(0xffF0F0F0),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: area,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Area';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Area',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: streetName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Street name';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Street name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: buildingName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your building name/number';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Building name/number',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: floorNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Street Floor number';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Floor number',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: apartmentNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Apartment number';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Apartment number',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: landlineNumber,
                    decoration: const InputDecoration(
                      labelText: 'Landline number (optional)',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        await MoreClass().addAddress(
                            area: area.text,
                            streetName: streetName.text,
                            buildingName: buildingName.text,
                            floorNumber: floorNumber.text,
                            apartmentNumber: apartmentNumber.text,
                            landlineNumber: landlineNumber.text);
                        Navigator.pushNamed(context, HomeNavBarPatient.id);

                        isLoading = false;
                        setState(() {});
                      }
                      return;
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff69B5AB),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 50,
                      width: 234,
                      child: const Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
