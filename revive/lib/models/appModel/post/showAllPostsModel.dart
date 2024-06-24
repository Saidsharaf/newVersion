class ShowAllPostsModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Posts>? posts;

  ShowAllPostsModel({this.status, this.errNum, this.msg, this.posts});

  ShowAllPostsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  String? description;
  int? userId;
  String? path;
  dynamic view;
  dynamic report;
  String? createdAt;
  int? fav;
  int? comment;
  bool? saved;
  User? user;

  Posts(
      {this.id,
      this.description,
      this.userId,
      this.path,
      this.view,
      this.report,
      this.createdAt,
      this.fav,
      this.comment,
      this.saved,
      this.user});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    userId = json['user_id'];
    path = json['path'];
    view = json['view'];
    report = json['report'];
    createdAt = json['created_at'];
    fav = json['fav'];
    comment = json['comment'];
    saved = json['saved'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['path'] = this.path;
    data['view'] = this.view;
    data['report'] = this.report;
    data['created_at'] = this.createdAt;
    data['fav'] = this.fav;
    data['comment'] = this.comment;
    data['saved'] = this.saved;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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