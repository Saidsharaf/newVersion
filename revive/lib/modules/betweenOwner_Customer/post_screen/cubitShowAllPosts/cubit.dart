import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/post/addReportModel.dart';
import 'package:revive/models/appModel/post/showAllPostsModel.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ShowAllPostsCubit extends Cubit<ShowAllPostsStates> {
  ShowAllPostsCubit() : super(showAllPostsInitialState());

  List<dynamic> users = [];
  ShowAllPostsModel? showAllPostsModel;
  AddReportModel? addReportModel;
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
}
