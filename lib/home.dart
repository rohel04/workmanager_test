import 'package:flutter/material.dart';
import 'package:workmanager_test/notification_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await LocalNotificationService().showLocalNotification(
            id: 0,
            title: "Test",
            body: "Testing",
            payload: "Data",
          );
        },
        child: const Text('Trigger'),
      ),
      appBar: AppBar(
        title: const Text("WorkManager Test"),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
