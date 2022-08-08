import 'package:flutter/material.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PrescriptionScreenState();

}

class PrescriptionScreenState extends State<PrescriptionScreen> {
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