class MUserProfile {
  String? email;
  String? firstName;
  String? lastName;
  String? profilePic;

  MUserProfile({this.email, this.firstName, this.lastName, this.profilePic});

  MUserProfile.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_pic'] = profilePic;
    return data;
  }
}