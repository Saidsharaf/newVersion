class ShowPercentageModel {
  bool? status;
  String? errNum;
  String? msg;
  Percentage? percentage;

  ShowPercentageModel({this.status, this.errNum, this.msg, this.percentage});

  ShowPercentageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    percentage = json['percentage'] != null
        ? new Percentage.fromJson(json['percentage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.percentage != null) {
      data['percentage'] = this.percentage!.toJson();
    }
    return data;
  }
}

class Percentage {
  int? totalCF;
  int? mCFActually;
  double? percentageConsumption;
  double? remainingPercentage;
  String? machineHave;

  Percentage(
      {this.totalCF,
      this.mCFActually,
      this.percentageConsumption,
      this.remainingPercentage,
      this.machineHave});

  Percentage.fromJson(Map<String, dynamic> json) {
    totalCF = json['total_CF'];
    mCFActually = json['MCF_actually'];
    percentageConsumption = json['percentage_consumption'];
    remainingPercentage = json['remaining_percentage'];
    machineHave = json['machine have'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_CF'] = this.totalCF;
    data['MCF_actually'] = this.mCFActually;
    data['percentage_consumption'] = this.percentageConsumption;
    data['remaining_percentage'] = this.remainingPercentage;
    data['machine have'] = this.machineHave;
    return data;
  }
}