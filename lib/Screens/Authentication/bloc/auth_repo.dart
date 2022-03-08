import 'package:eshop/Models/signup.dart';
import 'package:eshop/Services/app_api.dart';

class AuthRepo {
  final api = AppApi();
  String? _email;
  String? _password;
  MSignup msignup = MSignup();

  set email(v) => _email = v;
  String get email => _email ?? "";

  set password(v) => _password = v;
  String get password => _password ?? "";

  validate() {
    if (email.isEmpty || password.isEmpty) {
      return "Email or password is wrong.";
    } else {
      return null;
    }
  }

  login() async {
    final body = {"email": email, "password": password};
    final response = await api.login(body);
    return response;
  }

  signup() async {
    final body = msignup.toJson();
    final response = await api.signup(body);
    return response;
  }
}
