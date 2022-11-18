import 'package:flutter/cupertino.dart';
import 'package:openid_client/openid_client.dart';
import 'package:vidis/infrastructure/services/authentication_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  TokenResponse? token;

  void _openLoginFlow(BuildContext context) {
    AuthenticationService().login().then((value) => {
      setState(() {
        token = value;
      })
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Image(image: AssetImage('assets/logo.png')),
          middle: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        child: SafeArea(
          child: ListView(
              children: [
                CupertinoButton.filled(
                    child: const Text("Login"),
                    onPressed: () => _openLoginFlow(context),
                ),
                Text(token?.tokenType ?? 'No token')
            ]
          )
        ),
    );
  }
}