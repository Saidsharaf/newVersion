import 'package:revive/models/appModel/post/fav/showFavModel.dart';

abstract class ShowLikesStates {}

class showLikestInitialState extends ShowLikesStates {}

class showLikestLoadingState extends ShowLikesStates {}

class showLikestSuccessState extends ShowLikesStates {
  final ShowFavModel showFavModel;
  showLikestSuccessState(this.showFavModel);
}

class showLikestErrorState extends ShowLikesStates {
  final String error;
  showLikestErrorState(this.error);
}
