

import 'package:revive/models/appModel/post/addPost.dart';

abstract class AddPostStates {}
class addPostInitialState extends AddPostStates {}

class addPostLoadingState extends AddPostStates {}

class addPostSuccessState extends AddPostStates {
  final AddPostModel addPostModel;
  addPostSuccessState(this.addPostModel);
}

class addPostErrorState extends AddPostStates {
  final String error;
  addPostErrorState(this.error);
}

class addPostUploadState extends AddPostStates {}
class addPostUploadCamState extends AddPostStates {}
class addPostbottCamState extends AddPostStates {}

