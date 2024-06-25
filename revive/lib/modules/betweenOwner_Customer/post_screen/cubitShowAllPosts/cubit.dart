import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/restoreUsers/showRestore.dart';
import 'package:revive/models/appModel/post/addReportModel.dart';
import 'package:revive/models/appModel/post/deletePostModel.dart';
import 'package:revive/models/appModel/post/doRestoreModel.dart';
import 'package:revive/models/appModel/post/showAllPostsModel.dart';
import 'package:revive/models/appModel/post/showMyPosts.dart';
import 'package:revive/models/appModel/post/showOnePostModel.dart';
import 'package:revive/models/appModel/post/showRestorePostModel.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ShowAllPostsCubit extends Cubit<ShowAllPostsStates> {
  ShowAllPostsCubit() : super(showAllPostsInitialState());

  List<dynamic> users = [];
  ShowAllPostsModel? showAllPostsModel;
  AddReportModel? addReportModel;
  ShowMyPostsModel? showMyPostsModel;
  ShowOnePostModel? showOnePostModel;
  ShowRestorePostModel? showRestorePostModel;
  DoRestorePostModel? doRestorePostModel;
  DeletePostModel? deletePostModel;
  static ShowAllPostsCubit get(context) => BlocProvider.of(context);

  void showAllPosts() {
    emit(showAllPostsLoadingState());
    DioHelper.getAdminData(
      url: AllPOSTS,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
      },
    ).then((value) {
      print(value.data);
      showAllPostsModel = ShowAllPostsModel.fromJson(value.data);
      users = value.data["posts"];
      print(users);
      print(":::::::::::::::::::::::::::");
      print(users[1]["user"]["username"]);
      emit(showAllPostsSuccessState(showAllPostsModel!));
    }).catchError(
      (error) {
        emit(showAllPostsErrorState(error.toString()));
      },
    );
  }

  void showMyPosts() {
    emit(showMyPostsLoadingState());
    DioHelper.getAdminData(
      url: MYPOSTS,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
      },
    ).then((value) {
      print(value.data);
      showMyPostsModel = ShowMyPostsModel.fromJson(value.data);
      users = value.data["posts"]["posts"];
      print(users);
      print(":::::::::::::::::::::::::::");
      print(users[1]["description"]);
      emit(showMyPostsSuccessState(showMyPostsModel!));
    }).catchError(
      (error) {
        emit(showMyPostsErrorState(error.toString()));
      },
    );
  }

  void showOnePost({@required int? id}) {
    emit(showOnePostLoadingState());
    DioHelper.getAdminData(
      url: ONEPOST,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "postid": id
      },
    ).then((value) {
      print(value.data);
      showOnePostModel = ShowOnePostModel.fromJson(value.data);
      print(showOnePostModel!.post!.id);
      print(":::::::::::::::::::::::::::");
      emit(showOnePostSuccessState(showOnePostModel!));
    }).catchError(
      (error) {
        emit(showOnePostErrorState(error.toString()));
      },
    );
  }
  void showRestorePost() {
    emit(showRestorePostLoadingState());
    DioHelper.getAdminData(
      url: SHOWRESTOREPOST,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
      },
    ).then((value) {
      print(value.data);
      showRestorePostModel = ShowRestorePostModel.fromJson(value.data);
      users = value.data["posts"];
      print(users);
      print(":::::::::::::::::::::::::::");
      emit(showRestorePostSuccessState(showRestorePostModel!));
    }).catchError(
      (error) {
        emit(showRestorePostErrorState(error.toString()));
      },
    );
  }
  void DoRestorePost({@required int? id}) {
    emit(doRestorePostLoadingState());
    DioHelper.postData(
      url: DORESTOREPOST,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "id": id
      },
    ).then((value) {
      print(value.data);
      doRestorePostModel = DoRestorePostModel.fromJson(value.data);
      print(users);
      print(":::::::::::::::::::::::::::");
      emit(doRestorePostSuccessState(doRestorePostModel!));
    }).catchError(
      (error) {
        emit(doRestorePostErrorState(error.toString()));
      },
    );
  }

  void addReportPost({
    @required int? id,
  }) {
    emit(addReportLoadingState());
    DioHelper.postData(
      url: ADDREPORT,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "postid": id
      },
    ).then((value) {
      print(value.data);
      addReportModel = AddReportModel.fromJson(value.data);
      emit(addReportSuccessState(addReportModel!));
    }).catchError(
      (error) {
        emit(addReportErrorState(error.toString()));
      },
    );
  }
  void DeletePost({
    @required int? id,
  }) {
    emit(deleteLoadingState());
    DioHelper.DeleteData(
      url: DELETEPOST,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "postid": id
      },
    ).then((value) {
      print(value.data);
      deletePostModel = DeletePostModel.fromJson(value.data);
     if (!isClosed) emit(deleteSuccessState(deletePostModel!));
    }).catchError(
      (error) {
        emit(deleteErrorState(error.toString()));
      },
    );
  }
}
