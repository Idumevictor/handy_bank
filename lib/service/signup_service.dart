import 'dart:io';
import 'package:dio/dio.dart';
import 'package:handy_bank/core/api_endpoint.dart';
import 'package:handy_bank/model/request_model/log_in_request_model.dart';
import 'package:handy_bank/model/request_model/sign_up_request_model.dart';
import 'package:handy_bank/model/response_model/log_in_response_model.dart';
import 'package:handy_bank/model/response_model/sign_up_response_model.dart';

class SignUPUserService {
  static final Dio dio = Dio();

  static Future<SignUpUserResponseModel?> LogIn(
      SignUpUserRequestModel signUpUser) async {
    final url = ApiEndpoints.logInUser();
    print(url);
    try {
      var response = await dio.post(
        url,
        data: signUpUser.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = SignUpUserResponseModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
        return SignUpUserResponseModel(message: e.message);
      } else if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);

        return SignUpUserResponseModel(
            message: e.response!.data['message']);
      } else {}
    }
  }
}
