
import 'package:revive/models/appModel/adminModel/allUsers/alluser.dart';

abstract class AllUsersStates {}

class allUsersInitialState extends AllUsersStates {}

class allUsersLoadingState extends AllUsersStates {}

class allUsersChangeIndexState extends AllUsersStates {}
class allUsersChangeDropDownState extends AllUsersStates {}

class allUsersSuccessState extends AllUsersStates {
  final AllUsersModel allUsersModel;

  allUsersSuccessState(this.allUsersModel);
}

class allUsersErrorState extends AllUsersStates {
  final String error;
  allUsersErrorState(this.error);
}
class deletedUsersLoadingState extends AllUsersStates {}

class deletedUsersSuccessState extends AllUsersStates {
  final AllUsersModel allUsersModel;

  deletedUsersSuccessState(this.allUsersModel);
}

class deletedUsersErrorState extends AllUsersStates {
  final String error;
  deletedUsersErrorState(this.error);
}
