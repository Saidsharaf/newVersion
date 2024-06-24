
import 'package:revive/models/appModel/post/addReportModel.dart';
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

class addReportLoadingState extends ShowAllPostsStates {}

class addReportSuccessState extends ShowAllPostsStates {
  final AddReportModel addReportModel;
  addReportSuccessState(this.addReportModel);
}

class addReportErrorState extends ShowAllPostsStates {
  final String error;
  addReportErrorState(this.error);
}
