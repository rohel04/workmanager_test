import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:workmanager_test/home.dart';
import 'package:workmanager_test/notification_service.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    log('Executed');

    await LocalNotificationService().showLocalNotification(
      id: 0,
      title: "Test",
      body: "Testing",
      payload: "Data",
    );
    if (taskName == "simpleTask") {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  });
  // One off task registration
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  Workmanager().registerPeriodicTask(
    "task-identifier",
    "simpleTask",
    initialDelay: const Duration(seconds: 20),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
