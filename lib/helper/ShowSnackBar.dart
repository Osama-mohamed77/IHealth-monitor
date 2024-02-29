// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
