class ReportFactoryModel {
  bool? status;
  String? errNum;
  String? msg;
  List<String>? pythonOutput;

  ReportFactoryModel({this.status, this.errNum, this.msg, this.pythonOutput});

  ReportFactoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    pythonOutput = json['Python Output'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    data['Python Output'] = this.pythonOutput;
    return data;
  }
}