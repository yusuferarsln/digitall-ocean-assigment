class CrewModel {
  String? firstName;
  String? lastName;
  String? Nationality;
  String? jobTitle;
  String? image;
  int? id;

  List<String>? certificateNames;
  List<String>? certificateDates;

  CrewModel(
      {this.certificateDates,
      this.certificateNames,
      this.firstName,
      this.lastName,
      this.jobTitle,
      this.Nationality,
      this.image,
      this.id});
}
