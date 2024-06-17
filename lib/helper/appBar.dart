// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20in%20doctor.dart';

class logout extends StatelessWidget {
  const logout({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.pushNamedAndRemoveUntil(
              context, SignIn.id, (route) => false);
        },
        icon: const Icon(
          Icons.exit_to_app,
          size: 50,
        ));
  }
}
