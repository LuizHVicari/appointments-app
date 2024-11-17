class PatientModel {
  final String patientId;
  final String name;
  final String gender;
  final String phoneNumber;
  final int age;
  final String additionalInformation;

  PatientModel(this.additionalInformation, {
    required this.patientId, 
    required this.name, 
    required this.gender, 
    required this.phoneNumber, 
    required this.age
    });

}