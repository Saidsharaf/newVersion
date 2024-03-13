import 'package:revive/models/loginModel/login_model.dart';

abstract class RegisterStates {}

class registerInitialState extends RegisterStates {}

class registerChangeShowPassState extends RegisterStates {}

class registerLoadingState extends RegisterStates {}

class registerSuccessState extends RegisterStates {
  final LoginModel loginModel;

  registerSuccessState(this.loginModel);
}

class registerErrorState extends RegisterStates {
  final String error;
  registerErrorState(this.error);
}
