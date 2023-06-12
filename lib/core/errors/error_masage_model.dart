class ErrorMassageModel {
  String status, massage;
  int code;
  ErrorMassageModel({
    required this.massage,
    required this.status,
    required this.code,
  });

  factory ErrorMassageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMassageModel(massage: json["massage"], status: json["status"], code: json["code"]);
}

