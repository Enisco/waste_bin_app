import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:waste_bin_app/presentation/controller.dart';
import 'package:waste_bin_app/services/background_services.dart';
import 'package:waste_bin_app/services/local_notif_services.dart';
import 'package:waste_bin_app/waste_bin_app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  LocalNotificationServices localNotificationServices =
      LocalNotificationServices();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  // AndroidInitializationSettings('@mipmap/ic');

  // ignore: prefer_const_constructors
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  localNotificationServices.initializeNotificationServices();
  BackgroundService backgroundService = BackgroundService();
  backgroundService.initializeBackgroundService();
  final controller = Get.put(SmartWasteBinController());
  controller.mqttConnect();

  runApp(const SmartWasteBinApp());
}
