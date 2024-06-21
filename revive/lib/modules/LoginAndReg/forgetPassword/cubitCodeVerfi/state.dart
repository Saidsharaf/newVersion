import 'package:revive/models/appModel/forgetPassModel/code.dart';
import 'package:revive/models/appModel/forgetPassModel/newPass.dart';

abstract class CodeStates {}
class codeInitialState extends CodeStates {}

class codeLoadingState extends CodeStates {}

class codeSuccessState extends CodeStates {
  final CodeModel codeModel;
  codeSuccessState(this.codeModel);
}

class codeErrorState extends CodeStates {
  final String error;
  codeErrorState(this.error);
}
class newPassLoadingState extends CodeStates {}

class newPassSuccessState extends CodeStates {
  final NewPassModel newPassModel;
  newPassSuccessState(this.newPassModel);
}

class newPassErrorState extends CodeStates {
  final String error;
  newPassErrorState(this.error);
}
