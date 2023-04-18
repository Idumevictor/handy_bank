class LogInUserRequestModel {
    LogInUserRequestModel({
        this.password,
        this.phoneNumber,
    });

    final String? password;
    final String? phoneNumber;

    factory LogInUserRequestModel.fromJson(Map<String, dynamic> json) => LogInUserRequestModel(
        password: json["password"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "phoneNumber": phoneNumber,
    };
}