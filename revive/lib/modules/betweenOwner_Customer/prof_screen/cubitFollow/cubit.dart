import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/post/follow/DeleteFollowModel.dart';
import 'package:revive/models/appModel/post/follow/ShowFollowerModel.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/cubitFollow/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class FollowerCubit extends Cubit<FollowerStates> {
  FollowerCubit() : super(showFollowerInitialState());
  static FollowerCubit get(context) => BlocProvider.of(context);

  ShowFollowerModel? showFollowModel;
  DeleteFollowModel? deleteFollowModel;
  List<dynamic> users = [];

  void showFollow() {
    emit(showFollowerLoadingState());
    users = [];
    DioHelper.getAdminData(
      url: SHOWFOLLOWER,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
      },
    ).then((value) {
      print(value.data);
      showFollowModel = ShowFollowerModel.fromJson(value.data);
      users = value.data["followers"];
      print(users);
      print(":::::::::::::::::::::::::::");
      if (!isClosed) emit(showFollowerSuccessState(showFollowModel!));
    }).catchError(
      (error) {
        emit(showFollowerErrorState(error.toString()));
      },
    );
  }
  void deleteFollow({@required int?id}) {
    emit(deleteFollowLoadingState());
    users = [];
    DioHelper.getAdminData(
      url: DELETEFOLLOW,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "userfollowing" : id
      },
    ).then((value) {
      print(value.data);
      deleteFollowModel = DeleteFollowModel.fromJson(value.data);
      print(":::::::::::::::::::::::::::");
      if (!isClosed) emit(deleteFollowSuccessState(deleteFollowModel!));
    }).catchError(
      (error) {
        emit(deleteFollowErrorState(error.toString()));
      },
    );
  }
}
