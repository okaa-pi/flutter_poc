import 'package:flutter/material.dart';

import '../presentation/screens/main_screen.dart';

void main() {
  runApp(const VidisApp());
}

class VidisApp extends StatelessWidget {
  const VidisApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My medicines',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      ),
      home: const MainScreen(),
    );
  }
}
