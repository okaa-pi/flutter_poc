import 'package:vidis/infrastructure/model/v1.dart';

class ApiException implements Exception {
  Error cause;
  ApiException(this.cause);
}