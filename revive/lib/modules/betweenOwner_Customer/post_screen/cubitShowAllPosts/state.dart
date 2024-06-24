
import 'package:revive/models/appModel/post/showAllPostsModel.dart';

abstract class ShowAllPostsStates {}
class showAllPostsInitialState extends ShowAllPostsStates {}

class showAllPostsLoadingState extends ShowAllPostsStates {}

class showAllPostsSuccessState extends ShowAllPostsStates {
  final ShowAllPostsModel showAllPostsModel;
  showAllPostsSuccessState(this.showAllPostsModel);
}

class showAllPostsErrorState extends ShowAllPostsStates {
  final String error;
  showAllPostsErrorState(this.error);
}
