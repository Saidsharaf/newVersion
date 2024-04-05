import 'package:revive/models/appModel/login_model.dart';

abstract class LoginStates {}

class loginInitialState extends LoginStates {}

class loginChangeShowPassState extends LoginStates {}

class loginLoadingState extends LoginStates {}

class loginSuccessState extends LoginStates {
  final LoginModel loginModel;

  loginSuccessState(this.loginModel);
}

class loginErrorState extends LoginStates {
  final String error;
  loginErrorState(this.error);
}
