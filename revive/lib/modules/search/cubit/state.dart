import 'package:revive/models/appModel/post/follow/AddFollowModel.dart';
import 'package:revive/models/appModel/post/search/searchModel.dart';

abstract class SearchStates {}

class searchInitialState extends SearchStates {}

class searchLoadingState extends SearchStates {}

class searchSuccessState extends SearchStates {
  final SearchModel searchModel;
  searchSuccessState(this.searchModel);
}

class searchErrorState extends SearchStates {
  final String error;
  searchErrorState(this.error);
}


class addFollowLoadingState extends SearchStates {}

class addFollowSuccessState extends SearchStates {
  final AddFollowModel addFollowModel;
  addFollowSuccessState(this.addFollowModel);
}

class addFollowErrorState extends SearchStates {
  final String error;
  addFollowErrorState(this.error);
}

