import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_bin_app/presentation/controller.dart';
import 'package:waste_bin_app/waste_bin_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = Get.put(SmartWasteBinController());
  controller.mqttConnect();
  runApp(const SmartWasteBinApp());
}
