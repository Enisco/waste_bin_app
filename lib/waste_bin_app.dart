// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_bin_app/presentation/view.dart';

class SmartWasteBinApp extends StatelessWidget {
  const SmartWasteBinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Waste Bin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SmartWasteBinView(),
    );
  }
}
