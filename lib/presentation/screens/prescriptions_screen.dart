import 'package:flutter/material.dart';

class PrescriptionsScreen extends StatefulWidget {
  const PrescriptionsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PrescriptionsScreenState();

}

class PrescriptionsScreenState extends State<PrescriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescriptions"),
      ),
      body: const Center(
        child: Text("Prescriptions"),
      )
    );
  }

}