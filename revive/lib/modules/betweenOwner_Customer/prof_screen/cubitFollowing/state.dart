
import 'package:revive/models/appModel/post/follow/DeleteFollowModel.dart';
import 'package:revive/models/appModel/post/follow/ShowFollowingModel.dart';

abstract class FollowingStates {}
class showFollowingInitialState extends FollowingStates {}


class showFollowingLoadingState extends FollowingStates {}

class showFollowingSuccessState extends FollowingStates {
  final ShowFollowingModel showFollowingModel;
  showFollowingSuccessState(this.showFollowingModel);
}

class showFollowingErrorState extends FollowingStates {
  final String error;
  showFollowingErrorState(this.error);
}

class deleteFollowLoadingState extends FollowingStates {}

class deleteFollowSuccessState extends FollowingStates {
  final DeleteFollowModel deleteFollowModel;
  deleteFollowSuccessState(this.deleteFollowModel);
}

class deleteFollowErrorState extends FollowingStates {
  final String error;
  deleteFollowErrorState(this.error);
}


