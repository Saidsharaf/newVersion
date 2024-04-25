// class AllUsersModel {
//   bool? status;
//   String? errNum;
//   String? msg;
//   List<Users>? users =[];

//   AllUsersModel({this.status, this.errNum, this.msg, this.users});

//   AllUsersModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     errNum = json['errNum'];
//     msg = json['msg'];
//     if (json['users'] != null) {
//       users = <Users>[];
//       json['users'].forEach((v) {
//         users!.add(v);
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['errNum'] = this.errNum;
//     data['msg'] = this.msg;
//     if (this.users != null) {
//       data['users'] = this.users!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Users {
//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   String? gmail;
//   String? password;
//   int? role;
//   String? gender;
//   int? phone;
//   String? personalCard;
//   String? birthday;
//   String? profilePhoto;
//   Null? carbonFootprint;

//   Users(
//       {this.id,
//       this.name,
//       this.username,
//       this.email,
//       this.gmail,
//       this.password,
//       this.role,
//       this.gender,
//       this.phone,
//       this.personalCard,
//       this.birthday,
//       this.profilePhoto,
//       this.carbonFootprint});

//   Users.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     username = json['username'];
//     email = json['email'];
//     gmail = json['gmail'];
//     password = json['password'];
//     role = json['role'];
//     gender = json['gender'];
//     phone = json['phone'];
//     personalCard = json['Personal_card'];
//     birthday = json['birthday'];
//     profilePhoto = json['profile_photo'];
//     carbonFootprint = json['carbon_footprint'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['gmail'] = this.gmail;
//     data['password'] = this.password;
//     data['role'] = this.role;
//     data['gender'] = this.gender;
//     data['phone'] = this.phone;
//     data['Personal_card'] = this.personalCard;
//     data['birthday'] = this.birthday;
//     data['profile_photo'] = this.profilePhoto;
//     data['carbon_footprint'] = this.carbonFootprint;
//     return data;
//   }
// }

class AllUsersModel {
  bool? status;
  List<UsersModel>? users = [];

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['users'] != null) {
      json["users"].forEach((element) {
        users!.add(new UsersModel.fromJson(element));
      });
    }
  }
}

class UsersModel {
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
  Null? carbonFootprint;
  UsersModel.fromJson(Map<String, dynamic> json) {
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
  }
}
