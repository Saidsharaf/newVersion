
import 'package:revive/models/appModel/adminModel/allUsers/alluser.dart';

abstract class AllUsersStates {}

class allUsersInitialState extends AllUsersStates {}

class allUsersLoadingState extends AllUsersStates {}

class allUsersSuccessState extends AllUsersStates {
  final AllUsersModel allUsersModel;

  allUsersSuccessState(this.allUsersModel);
}

class allUsersErrorState extends AllUsersStates {
  final String error;
  allUsersErrorState(this.error);
}
