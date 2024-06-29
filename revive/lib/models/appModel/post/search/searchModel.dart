class SearchModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Users>? users;

  SearchModel({this.status, this.errNum, this.msg, this.users});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
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
  String? name;
  String? username;
  String? email;
  String? profilePhoto;
  int? id;

  Users({this.name, this.username, this.email, this.profilePhoto, this.id});

  Users.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profilePhoto = json['profile_photo'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['profile_photo'] = this.profilePhoto;
    data['id'] = this.id;
    return data;
  }
}