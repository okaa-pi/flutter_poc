import 'package:flutter/material.dart';

import '../screens/prescriptions_screen.dart';

class PrescriptionsListPage extends StatelessWidget {
  const PrescriptionsListPage({Key? key}) : super(key: key);

  void _openPrescriptionsPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PrescriptionsScreen()));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Prescriptions list"),
        ElevatedButton(
            child: const Text("Open details"),
            onPressed: () => _openPrescriptionsPage(context)
        )
      ]
    );
  }
}