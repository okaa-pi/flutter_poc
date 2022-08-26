import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Image(image: AssetImage('assets/logo.png')),
          middle: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        child: Text("Home")
    );
  }
}