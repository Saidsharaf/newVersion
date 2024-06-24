class CarbonPersonModel {
  bool? status;
  String? errNum;
  String? msg;
  String? pythonOutput;

  CarbonPersonModel({this.status, this.errNum, this.msg, this.pythonOutput});

  CarbonPersonModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    pythonOutput = json['Python Output'];
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