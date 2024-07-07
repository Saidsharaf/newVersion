class MachineOwnerModel {
  bool? status;
  String? errNum;
  String? msg;
  Users? users;

  MachineOwnerModel({this.status, this.errNum, this.msg, this.users});

  MachineOwnerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    users = json['Users'] != null ? new Users.fromJson(json['Users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.users != null) {
      data['Users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? username;
  String? email;
  String? gmail;
  String? password;
  int? role;
  String? gender;
  int? phone;
  String? personalCard;
  String? birthday;
  String? profilePhoto;
  dynamic carbonFootprint;
  dynamic deletedAt;
  String? apiToken;

  Users(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.gmail,
      this.password,
      this.role,
      this.gender,
      this.phone,
      this.personalCard,
      this.birthday,
      this.profilePhoto,
      this.carbonFootprint,
      this.deletedAt,
      this.apiToken});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    gmail = json['gmail'];
    password = json['password'];
    role = json['role'];
    gender = json['gender'];
    phone = json['phone'];
    personalCard = json['Personal_card'];
    birthday = json['birthday'];
    profilePhoto = json['profile_photo'];
    carbonFootprint = json['carbon_footprint'];
    deletedAt = json['deleted_at'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['gmail'] = this.gmail;
    data['password'] = this.password;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['Personal_card'] = this.personalCard;
    data['birthday'] = this.birthday;
    data['profile_photo'] = this.profilePhoto;
    data['carbon_footprint'] = this.carbonFootprint;
    data['deleted_at'] = this.deletedAt;
    data['api_token'] = this.apiToken;
    return data;
  }
}