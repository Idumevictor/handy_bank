class RetrieveAccountNumberModel {
    RetrieveAccountNumberModel({
        this.message,
    });

    final String? message;

    factory RetrieveAccountNumberModel.fromJson(Map<String, dynamic> json) => RetrieveAccountNumberModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
