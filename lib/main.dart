import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vidis/presentation/cupertino/screens/main_screen.dart' as ios;
import 'package:vidis/presentation/material/screens/main_screen.dart' as android;


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
        home: ios.MainScreen(),
      );
    }
    else {
      return MaterialApp(
        title: 'My medicines',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue
        ),
        home: const android.MainScreen(),
      );
    }
  }
}
