class ShowFollowingModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Following>? following;

  ShowFollowingModel({this.status, this.errNum, this.msg, this.following});

  ShowFollowingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['following'] != null) {
      following = <Following>[];
      json['following'].forEach((v) {
        following!.add(new Following.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.following != null) {
      data['following'] = this.following!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Following {
  int? followingId;
  Userfollowing? userfollowing;

  Following({this.followingId, this.userfollowing});

  Following.fromJson(Map<String, dynamic> json) {
    followingId = json['following_id'];
    userfollowing = json['userfollowing'] != null
        ? new Userfollowing.fromJson(json['userfollowing'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['following_id'] = this.followingId;
    if (this.userfollowing != null) {
      data['userfollowing'] = this.userfollowing!.toJson();
    }
    return data;
  }
}

class Userfollowing {
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

  Userfollowing(
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

  Userfollowing.fromJson(Map<String, dynamic> json) {
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