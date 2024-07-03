

import 'package:revive/models/appModel/post/follow/DeleteFollowModel.dart';
import 'package:revive/models/appModel/post/follow/ShowFollowerModel.dart';

abstract class FollowerStates {}
class showFollowerInitialState extends FollowerStates {}


class showFollowerLoadingState extends FollowerStates {}

class showFollowerSuccessState extends FollowerStates {
  final ShowFollowerModel showFollowerModel;
  showFollowerSuccessState(this.showFollowerModel);
}

class showFollowerErrorState extends FollowerStates {
  final String error;
  showFollowerErrorState(this.error);
}

class deleteFollowLoadingState extends FollowerStates {}

class deleteFollowSuccessState extends FollowerStates {
  final DeleteFollowModel deleteFollowModel;
  deleteFollowSuccessState(this.deleteFollowModel);
}

class deleteFollowErrorState extends FollowerStates {
  final String error;
  deleteFollowErrorState(this.error);
}

