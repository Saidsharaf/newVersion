
import 'package:revive/models/appModel/forgetPassModel/forget.dart';

abstract class ForgetStates {}

class forgetInitialState extends ForgetStates {}

class forgetChangeShowPassState extends ForgetStates {}

class forgetLoadingState extends ForgetStates {}

class forgetSuccessState extends ForgetStates {
  final ForgetModel forgetModel;

  forgetSuccessState(this.forgetModel);
}

class forgetErrorState extends ForgetStates {
  final String error;
  forgetErrorState(this.error);
}
