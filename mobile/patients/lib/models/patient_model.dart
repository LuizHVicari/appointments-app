import 'package:patients/models/user_model.dart';

class PatientModel {
  String? id;
  String? name;
  String? phone;
  int? age;
  String? gender;
  UserModel? user;

  PatientModel({this.id, this.name, this.phone, this.age, this.gender, this.user});

  PatientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    age = json['age'];
    gender = json['gender'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['age'] = age;
    data['gender'] = gender;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}