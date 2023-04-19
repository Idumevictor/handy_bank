import 'dart:io';
import 'package:dio/dio.dart';
import 'package:handy_bank/core/api_endpoint.dart';
import 'package:handy_bank/data/token_storage.dart';
import 'package:handy_bank/model/response_model/retrieve_account_response_model.dart';

class RetrieveAccountService {
  static final Dio dio = Dio();

  static Future<RetrieveAccountNumberModel?> getAccount(
      {required String phoneNUmber}) async {
    final url = ApiEndpoints.retrieveAccount(phoneNumber: phoneNUmber);
    print(url);
    final String token = TokenStorage.retrieveToken();
    try {
      var response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = RetrieveAccountNumberModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
        return RetrieveAccountNumberModel(message: e.message);
      } else if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);

        return RetrieveAccountNumberModel(message: e.response!.data['message']);
      } else {}
    }
  }
}
