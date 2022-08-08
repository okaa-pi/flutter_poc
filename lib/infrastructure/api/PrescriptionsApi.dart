import 'package:dio/dio.dart';
import 'package:vidis/infrastructure/constants.dart';
import 'package:vidis/infrastructure/model/v1.dart';

class PrescriptionsApi {

  final ApiConstants _apiConstants = ApiConstants.dev();

  Future<Prescription> getPrescriptionFromRid(String ridCode) async {
    var response = await Dio().get<Prescription>("${_apiConstants.baseUrl}/v1/openprescriptions/BEP04A4E4A2A");
    if(response.statusCode == 200) {
      return response.data!;
    }
    else {
      throw Exception('Failed to load prescription');
    }
  }

}