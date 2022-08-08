import 'package:flutter/cupertino.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("More"),
        ),
        child: Text("More")
    );
  }
}