import 'package:patients/models/patient_model.dart';
import 'package:patients/models/user_model.dart';

class AppointmentModel {
  String? id;
  UserModel? user;
  PatientModel? patient;
  DateTime? date;
  String? place;
  String? details;
  bool? confirmed;

  AppointmentModel(
      {this.id, this.user, this.patient, this.date, this.place, this.details, this.confirmed});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    patient =
        json['patient'] != null ? PatientModel.fromJson(json['patient']) : null;
    date = DateTime.parse(json['date']);
    place = json['place'];
    details = json['details'];
    confirmed = json['confirmed'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    data['date'] = date.toString();
    data['place'] = place;
    data['details'] = details;
    data['confirmed'] = confirmed;
    return data;
  }
}

