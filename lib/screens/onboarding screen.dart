// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Connect%20services.dart';
import 'package:ihealth_monitor/screens/Patient.dart';
import 'package:ihealth_monitor/screens/choose%20screen.dart';
import 'package:ihealth_monitor/screens/doctor%20screen.dart';
import 'package:ihealth_monitor/screens/shadow%20screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExplainScreens extends StatefulWidget {
  const ExplainScreens({super.key});

  @override
  State<ExplainScreens> createState() => _ExplainScreensState();
}

class _ExplainScreensState extends State<ExplainScreens> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              doctorExplain(),
              PatientExplain(),
              ShadowExplain(),
              ConnectExplain(),
              ChooseScreen()
            ],
          ),
          Container(
              alignment: const Alignment(0, .75),
              child: SmoothPageIndicator(controller: _controller, count: 5))
        ],
      ),
    );
  }
}
