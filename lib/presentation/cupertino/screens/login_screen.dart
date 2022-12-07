import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:openid_client/openid_client.dart';
import 'package:vidis/infrastructure/services/authentication_service.dart';
import 'package:vidis/presentation/cupertino/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> {

  Future<TokenResponse>? userToken;

  void _openLoginFlow(BuildContext context) {
    setState(() {
      userToken = AuthenticationService().login();
    });
  }

  void nextPage(BuildContext context) {
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Login"),
        ),
        child: Center(
            child: root(context)
        )
    );
  }

  Widget root(BuildContext context) {
    if(userToken == null) {
      return CupertinoButton.filled(
        child: const Text("Login"),
        onPressed: () => _openLoginFlow(context),
      );
    }
    else {
      return FutureBuilder<TokenResponse>(builder: (context, snapshot) {
        if(snapshot.hasData) {
          return loggedInUser(snapshot.requireData);
        }
        else if (snapshot.hasError) {
          return const Text('Error logging In');
        }
        return const CupertinoActivityIndicator();
      }, future: userToken);
    }
  }

  Widget loggedInUser(TokenResponse tokenResponse) {
    final userInfo = Jwt.parseJwt(tokenResponse.accessToken ?? '');

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome ${userInfo['given_name']}!'),
          const SizedBox(height: 16.0),
          CupertinoButton.filled(
            child: const Text("Continue"),
            onPressed: () => nextPage(context),
          )
        ]
    ));
  }


}