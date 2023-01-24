// ignore_for_file: unused_local_variable

import 'package:flutter_background/flutter_background.dart';

class BackgroundService {
  final androidConfig = const FlutterBackgroundAndroidConfig(
    notificationTitle: "Smart Waste Bin",
    notificationText:
        "Waste Bin App Running in Background",
    notificationImportance: AndroidNotificationImportance.Default,
    notificationIcon: AndroidResource(
        name: 'background_icon',
        defType: 'drawable'), // Default is ic_launcher from folder mipmap
  );

  initializeBackgroundService() async {
    bool hasPermissions = await FlutterBackground.hasPermissions;
    bool initialized =
        await FlutterBackground.initialize(androidConfig: androidConfig);
    bool enabledBackgroundExecution =
        await FlutterBackground.enableBackgroundExecution();
  }
}
