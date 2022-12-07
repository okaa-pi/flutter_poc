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

    urlLauncher(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    var issuer = await Issuer.discover(uri);
    var client = Client(issuer, clientId);

    var authenticator = Authenticator(client,
        scopes: scopes,
        port: port,
        urlLancher: urlLauncher);

    var c = await authenticator.authorize();

    var token = await c.getTokenResponse();

    return token;
  }

}