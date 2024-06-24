class ShowMyPostsModel {
  bool? status;
  String? errNum;
  String? msg;
  Posts? posts;

  ShowMyPostsModel({this.status, this.errNum, this.msg, this.posts});

  ShowMyPostsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.posts != null) {
      data['posts'] = this.posts!.toJson();
    }
    return data;
  }
}

class Posts {
  List<Posts>? posts;
  int? numposts;

  Posts({this.posts, this.numposts});

  Posts.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    numposts = json['numposts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    data['numposts'] = this.numposts;
    return data;
  }
}

class Postss {
  int? id;
  String? description;
  int? userId;
  String? path;
  int? view;
  dynamic report;
  String? createdAt;
  int? fav;
  int? comment;
  bool? saved;

  Postss(
      {this.id,
      this.description,
      this.userId,
      this.path,
      this.view,
      this.report,
      this.createdAt,
      this.fav,
      this.comment,
      this.saved});

  Postss.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}