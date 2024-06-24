import 'package:revive/models/appModel/post/showMyPosts.dart';

abstract class ShowMyPostsStates {}
class showMyPostsInitialState extends ShowMyPostsStates {}

class showMyPostsLoadingState extends ShowMyPostsStates {}

class showMyPostsSuccessState extends ShowMyPostsStates {
  final ShowMyPostsModel showMyPostsModel;
  showMyPostsSuccessState(this.showMyPostsModel);
}

class showMyPostsErrorState extends ShowMyPostsStates {
  final String error;
  showMyPostsErrorState(this.error);
}
