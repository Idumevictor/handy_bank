class SignUpUserRequestModel {
    SignUpUserRequestModel({
        this.firstName,
        this.lastName,
        this.emailAddress,
        this.password,
        this.phoneNumber,
    });

    final String? firstName;
    final String? lastName;
    final String? emailAddress;
    final String? password;
    final String? phoneNumber;

    factory SignUpUserRequestModel.fromJson(Map<String, dynamic> json) => SignUpUserRequestModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailAddress: json["emailAddress"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "password": password,
        "phoneNumber": phoneNumber,
    };
}
