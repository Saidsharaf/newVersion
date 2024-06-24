
import 'package:revive/models/appModel/post/showCommentModel.dart';

abstract class ShowCommentStates {}
class showCommentInitialState extends ShowCommentStates {}

class showCommentLoadingState extends ShowCommentStates {}

class showCommentSuccessState extends ShowCommentStates {
  final ShowCommentModel showCommentModel;
  showCommentSuccessState(this.showCommentModel);
}

class showCommentErrorState extends ShowCommentStates {
  final String error;
  showCommentErrorState(this.error);
}
