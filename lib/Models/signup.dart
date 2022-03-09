class MSignup {
  String? email;
  String? firstNname;
  String lastName = "";
  String? passsword;
  String? confirmPasssword;

  validate() {
    if (email == null || email!.isEmpty) {
      return "Please enter valid email.";
    } else if (firstNname == null || firstNname!.isEmpty) {
      return "Please enter valid first Name";
    } else if (passsword == null ||
        passsword!.isEmpty ||
        confirmPasssword == null ||
        confirmPasssword!.isEmpty) {
      return "Please enter valid password";
    } else if (passsword != confirmPasssword) {
      return "Password and confirm password should match";
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstNname;
    data['email'] = email;
    data['last_name'] = lastName;
    data['password'] = passsword;
    data['password1'] = passsword;

    return data;
  }
}
