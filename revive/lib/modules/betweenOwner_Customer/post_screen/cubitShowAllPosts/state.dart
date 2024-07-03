
import 'package:revive/models/appModel/post/addReportModel.dart';
import 'package:revive/models/appModel/post/deletePostModel.dart';
import 'package:revive/models/appModel/post/doRestoreModel.dart';
import 'package:revive/models/appModel/post/fav/AddFavModel.dart';
import 'package:revive/models/appModel/post/showAllPostsModel.dart';
import 'package:revive/models/appModel/post/showMyPosts.dart';
import 'package:revive/models/appModel/post/showOnePostModel.dart';
import 'package:revive/models/appModel/post/showRestorePostModel.dart';

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

class showMyPostsLoadingState extends ShowAllPostsStates {}

class showMyPostsSuccessState extends ShowAllPostsStates {
  final ShowMyPostsModel showMyPostsModel;
  showMyPostsSuccessState(this.showMyPostsModel);
}

class showMyPostsErrorState extends ShowAllPostsStates {
  final String error;
  showMyPostsErrorState(this.error);
}


class showHisPostsLoadingState extends ShowAllPostsStates {}

class showHisPostsSuccessState extends ShowAllPostsStates {
  final ShowMyPostsModel showMyPostsModel;
  showHisPostsSuccessState(this.showMyPostsModel);
}

class showHisPostsErrorState extends ShowAllPostsStates {
  final String error;
  showHisPostsErrorState(this.error);
}



class showOnePostLoadingState extends ShowAllPostsStates {}

class showOnePostSuccessState extends ShowAllPostsStates {
  final ShowOnePostModel showOnePostModel;
  showOnePostSuccessState(this.showOnePostModel);
}

class showOnePostErrorState extends ShowAllPostsStates {
  final String error;
  showOnePostErrorState(this.error);
}


class showRestorePostLoadingState extends ShowAllPostsStates {}

class showRestorePostSuccessState extends ShowAllPostsStates {
  final ShowRestorePostModel showRestorePostModel;
  showRestorePostSuccessState(this.showRestorePostModel);
}

class showRestorePostErrorState extends ShowAllPostsStates {
  final String error;
  showRestorePostErrorState(this.error);
}


class doRestorePostLoadingState extends ShowAllPostsStates {}

class doRestorePostSuccessState extends ShowAllPostsStates {
  final DoRestorePostModel doRestorePostModel;
  doRestorePostSuccessState(this.doRestorePostModel);
}

class doRestorePostErrorState extends ShowAllPostsStates {
  final String error;
  doRestorePostErrorState(this.error);
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
class deleteLoadingState extends ShowAllPostsStates {}

class deleteSuccessState extends ShowAllPostsStates {
  final DeletePostModel deletePostModel;
  deleteSuccessState(this.deletePostModel);
}

class deleteErrorState extends ShowAllPostsStates {
  final String error;
  deleteErrorState(this.error);
}
class addFavLoadingState extends ShowAllPostsStates {}

class addFavSuccessState extends ShowAllPostsStates {
  final AddFavModel addFavModel;
  addFavSuccessState(this.addFavModel);
}

class addFavErrorState extends ShowAllPostsStates {
  final String error;
  addFavErrorState(this.error);
}

class removeFavLoadingState extends ShowAllPostsStates {}

class removeFavSuccessState extends ShowAllPostsStates {
  final AddFavModel addFavModel;
  removeFavSuccessState(this.addFavModel);
}

class removeFavErrorState extends ShowAllPostsStates {
  final String error;
  removeFavErrorState(this.error);
}
