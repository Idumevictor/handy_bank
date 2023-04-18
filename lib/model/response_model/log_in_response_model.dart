class LogInUserResponseModel {
    LogInUserResponseModel({
        this.message,
        this.token,
    });

    final String? message;
    final String? token;

    factory LogInUserResponseModel.fromJson(Map<String, dynamic> json) => LogInUserResponseModel(
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
    };
}