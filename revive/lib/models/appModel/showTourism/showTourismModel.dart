class ShowTourismModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Data>? data;

  ShowTourismModel({this.status, this.errNum, this.msg, this.data});

  ShowTourismModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? machineId;
  String? co;
  String? co2;
  int? o2;
  int? degree;
  int? humidity;
  int? expire;
  String? createdAt;
  Machine? machine;

  Data(
      {this.id,
      this.machineId,
      this.co,
      this.co2,
      this.o2,
      this.degree,
      this.humidity,
      this.expire,
      this.createdAt,
      this.machine});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    machineId = json['machine_id'];
    co = json['co'];
    co2 = json['co2'];
    o2 = json['o2'];
    degree = json['degree'];
    humidity = json['humidity'];
    expire = json['expire'];
    createdAt = json['created_at'];
    machine =
        json['machine'] != null ? new Machine.fromJson(json['machine']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['machine_id'] = this.machineId;
    data['co'] = this.co;
    data['co2'] = this.co2;
    data['o2'] = this.o2;
    data['degree'] = this.degree;
    data['humidity'] = this.humidity;
    data['expire'] = this.expire;
    data['created_at'] = this.createdAt;
    if (this.machine != null) {
      data['machine'] = this.machine!.toJson();
    }
    return data;
  }
}

class Machine {
  int? id;
  String? name;
  int? ownerId;
  String? location;
  int? type;
  dynamic warning;
  dynamic carbonFootprint;
  dynamic totalCF;
  dynamic weather;
  String? createdAt;

  Machine(
      {this.id,
      this.name,
      this.ownerId,
      this.location,
      this.type,
      this.warning,
      this.carbonFootprint,
      this.totalCF,
      this.weather,
      this.createdAt});

  Machine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ownerId = json['owner_id'];
    location = json['location'];
    type = json['type'];
    warning = json['warning'];
    carbonFootprint = json['carbon_footprint'];
    totalCF = json['total_CF'];
    weather = json['weather'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['owner_id'] = this.ownerId;
    data['location'] = this.location;
    data['type'] = this.type;
    data['warning'] = this.warning;
    data['carbon_footprint'] = this.carbonFootprint;
    data['total_CF'] = this.totalCF;
    data['weather'] = this.weather;
    data['created_at'] = this.createdAt;
    return data;
  }
}