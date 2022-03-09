import 'package:eshop/Constant/app_keys.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';
import 'package:eshop/Screens/Profile/bloc/user_bloc.dart';
import 'package:eshop/Screens/Profile/bloc/user_event.dart';
import 'package:eshop/Screens/Profile/bloc/user_repo.dart';
import 'package:eshop/Screens/Profile/bloc/user_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static final UserSession shared = UserSession._internal();

  factory UserSession() {
    return shared;
  }

  UserSession._internal() {
    _bloc = UserBloc(UserDeaultState(), UserRepo());
    _bloc?.add(LoadCartCountEvent());
  }
  bool _isLoggedIn = false;
  String? _token;
  UserBloc? _bloc;

  get token => _token;

  get isLoggedin => _isLoggedIn;
  set isLoggedin(v) => _isLoggedIn = v;
  UserBloc get bloc => _bloc!;

  setToekn(token) async {
    final prefs = await SharedPreferences.getInstance();
    if(token != null) prefs.setString(AppKeys.token, token);
  }

  retToekn() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppKeys.token, "");
  }

  Future<dynamic> getToekn() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(
      AppKeys.token,
    );
    return _token;
  }

  refreshCart() {
    _bloc?.add(LoadCartCountEvent());
  }

  addToCart(body) {
    _bloc?.add(AddCartEvent(body: body));
  }
}
