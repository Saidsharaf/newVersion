class ShowOnePostModel {
  bool? status;
  String? errNum;
  String? msg;
  Post? post;

  ShowOnePostModel({this.status, this.errNum, this.msg, this.post});

  ShowOnePostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  int? id;
  String? description;
  int? userId;
  String? path;
  int? view;
  dynamic report;
  String? createdAt;

  Post(
      {this.id,
      this.description,
      this.userId,
      this.path,
      this.view,
      this.report,
      this.createdAt});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    userId = json['user_id'];
    path = json['path'];
    view = json['view'];
    report = json['report'];
    createdAt = json['created_at'];
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
    return data;
  }
}