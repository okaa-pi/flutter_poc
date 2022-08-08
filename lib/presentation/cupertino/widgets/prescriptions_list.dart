import 'package:flutter/cupertino.dart';

import '../screens/prescription_screen.dart';

class PrescriptionsListPage extends StatelessWidget {
  const PrescriptionsListPage({Key? key}) : super(key: key);

  void _openPrescriptionsPage(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => const PrescriptionScreen()));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Prescriptions")
      ),
      child: SafeArea(
          child: Center(
            child:
              CupertinoButton.filled(
                  child: const Text("Open details"),
                  onPressed: () => _openPrescriptionsPage(context)
              )

        )
      ),
    );
  }
}