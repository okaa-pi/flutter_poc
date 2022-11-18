class ApiConstants {
  String baseUrl;
  String keycloakUrl;
  String clientId;

  ApiConstants.dev({
    this.baseUrl = "https://vidis-fake-api.int.pub.vascloud.be",
    this.keycloakUrl = "https://vasiam.int.pub.vascloud.be/auth/realms/MOOSE_NIHII",
    this.clientId = "vidis-fake-client"
  });

  ApiConstants.prod({
    this.baseUrl = "https://vidis-fake-api.int.pub.vascloud.be",
    this.keycloakUrl = "https://api-acpt.ehealth.fgov.be/auth/realms/healthcare",
    this.clientId = "nihdi-vidis-mobile"
  });

}