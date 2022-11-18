import 'package:flutter/foundation.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vidis/infrastructure/constants.dart';


class AuthenticationService {

  final ApiConstants _apiConstants = ApiConstants.dev();

  Future<TokenResponse> login() async {
    var uri = Uri.parse(_apiConstants.keycloakUrl);
    var clientId = _apiConstants.clientId;
    var scopes = List<String>.of(['openid', 'profile']);
    var port = 4200;

    print("Hello?");

    urlLauncher(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }
    print("Hello 2?");

    var issuer = await Issuer.discover(uri);
    var client = Client(issuer, clientId);

    print("Hello 3?");
    var authenticator = Authenticator(client,
        scopes: scopes,
        port: port,
        urlLancher: urlLauncher);

    // Doesn't work with redirectUri for some reason?
    // var authenticator = Authenticator(client,
    //     scopes: scopes,
    //     port: port,
    //     urlLancher: urlLauncher,
    //     redirectUri: Uri.parse("vidis://home"));

    print("Hello 4?");
    var c = await authenticator.authorize();

    print("Hello 5?");
    var token = await c.getTokenResponse();

    print("Hello 6?");
    if (kDebugMode) {
      print(token);
    }

    return token;
  }

}