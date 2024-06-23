class ShowRestoreModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Users>? users;

  ShowRestoreModel({this.status, this.errNum, this.msg, this.users});

  ShowRestoreModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'].toString();
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
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
  String? phone;
  String? personalCard;
  String? birthday;
  String? profilePhoto;
  String? carbonFootprint;
  String? deletedAt;

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
      this.deletedAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    username = json['username'];
    email = json['email'];
    gmail = json['gmail'].toString();
    password = json['password'];
    role = json['role'];
    gender = json['gender'];
    phone = json['phone'].toString();
    personalCard = json['Personal_card'].toString();
    birthday = json['birthday'];
    profilePhoto = json['profile_photo'];
    carbonFootprint = json['carbon_footprint'].toString();
    deletedAt = json['deleted_at'];
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
    return data;
  }
}