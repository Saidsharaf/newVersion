class ShowFollowerModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Followers>? followers;

  ShowFollowerModel({this.status, this.errNum, this.msg, this.followers});

  ShowFollowerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(new Followers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.followers != null) {
      data['followers'] = this.followers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Followers {
  int? followersId;
  Userfollowers? userfollowers;

  Followers({this.followersId, this.userfollowers});

  Followers.fromJson(Map<String, dynamic> json) {
    followersId = json['followers_id'];
    userfollowers = json['userfollowers'] != null
        ? new Userfollowers.fromJson(json['userfollowers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followers_id'] = this.followersId;
    if (this.userfollowers != null) {
      data['userfollowers'] = this.userfollowers!.toJson();
    }
    return data;
  }
}

class Userfollowers {
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

  Userfollowers(
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

  Userfollowers.fromJson(Map<String, dynamic> json) {
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