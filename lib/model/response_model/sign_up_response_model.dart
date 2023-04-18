class SignUpUserResponseModel {
    SignUpUserResponseModel({
        this.message,
        this.newUser,
    });

    final String? message;
    final NewUser? newUser;

    factory SignUpUserResponseModel.fromJson(Map<String, dynamic> json) => SignUpUserResponseModel(
        message: json["message"],
        newUser: NewUser.fromJson(json["newUser"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "newUser": newUser!.toJson(),
    };
}

class NewUser {
    NewUser({
        this.firstName,
        this.lastName,
        this.emailAddress,
        this.phoneNumber,
        this.accountNumber,
        this.role,
        this.isBlocked,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    final String? firstName;
    final String? lastName;
    final String? emailAddress;
    final String? phoneNumber;
    final String? accountNumber;
    final String? role;
    final bool? isBlocked;
    final String? id;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailAddress: json["emailAddress"],
        phoneNumber: json["phoneNumber"],
        accountNumber: json["accountNumber"],
        role: json["role"],
        isBlocked: json["isBlocked"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber,
        "accountNumber": accountNumber,
        "role": role,
        "isBlocked": isBlocked,
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
