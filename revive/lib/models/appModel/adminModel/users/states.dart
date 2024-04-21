
import 'package:revive/models/appModel/adminModel/users/show_users.dart';

abstract class ShowUserStates {}

class showUserInitialState extends ShowUserStates {}

class showUserLoadingState extends ShowUserStates {}

class showUserSuccessState extends ShowUserStates {
  final ShowUserModel showUserModel;

  showUserSuccessState(this.showUserModel);
}

class showUserErrorState extends ShowUserStates {
  final String error;
  showUserErrorState(this.error);
}
