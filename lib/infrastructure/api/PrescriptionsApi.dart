import 'package:dio/dio.dart';
import 'package:vidis/infrastructure/constants.dart';
import 'package:vidis/infrastructure/exceptions/ApiException.dart';
import 'package:vidis/infrastructure/model/v1.dart';

class PrescriptionsApi {

  final ApiConstants _apiConstants = ApiConstants.dev();

  Future<Prescription> getPrescriptionFromRid(String ridCode) async {
    try {
      var response = await Dio().get("${_apiConstants.baseUrl}/v1/openprescriptions/$ridCode");
      return Prescription.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        throw ApiException(Error.fromJson(e.response?.data));
      }
      else {
        throw Exception('Unknown exception');
      }
    }
  }

}