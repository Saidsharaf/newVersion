class SearchModel {
  bool? status;
  String? message;
  Data? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["msg"];
    data = json["Users"] != null ? Data.fromJson(json["Users"]) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["username"];
    email = json["email"];
    token = json["api_token"];
  }
}
