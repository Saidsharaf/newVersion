class ShowUserModel {
  bool? status;
  String? message;
  UserData? data;

  // LoginModel(this.status, this.message);
  ShowUserModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["msg"];
    data = json["users"] != null ? UserData.fromJson(json["users"]) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  int? role;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["username"];
    email = json["email"];
    role = json["role"];
    // phone = json["phone"];
    image = json["profile_photo"];
    // points = json["points"];
    // credit = json["credit"];
  }
}
