import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'presentation/material/screens/main_screen.dart';

void main() {
  runApp(const VidisApp());
}

class VidisApp extends StatelessWidget {
  const VidisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return const CupertinoApp(
        title: 'My medicines',
        home: Text('Hello')
      );
    }
    else {
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
}
