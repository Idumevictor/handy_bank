import 'dart:io';
import 'package:dio/dio.dart';
import 'package:handy_bank/core/api_endpoint.dart';
import 'package:handy_bank/model/request_model/log_in_request_model.dart';
import 'package:handy_bank/model/response_model/log_in_response_model.dart';

class LogInUserService {
  static final Dio dio = Dio();

  static Future<LogInUserResponseModel?> LogIn(
      LogInUserRequestModel logInUser) async {
    final url = ApiEndpoints.logInUser();
    print(url);
    try {
      var response = await dio.post(
        url,
        data: logInUser.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = LogInUserResponseModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
        return LogInUserResponseModel(message: e.message);
      } else if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);

        return LogInUserResponseModel(
            message: e.response!.data['message']);
      } else {}
    }
  }
}
