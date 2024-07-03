import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/post/follow/DeleteFollowModel.dart';
import 'package:revive/models/appModel/post/follow/ShowFollowingModel.dart';
import 'package:revive/modules/betweenOwner_Customer/prof_screen/cubitFollowing/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class FollowingCubit extends Cubit<FollowingStates> {
  FollowingCubit() : super(showFollowingInitialState());
  static FollowingCubit get(context) => BlocProvider.of(context);

  ShowFollowingModel? showFollowingModel;
  DeleteFollowModel ? deleteFollowModel;

  List<dynamic> users = [];


  void showFollowing() {
    emit(showFollowingLoadingState());
    users = [];
    DioHelper.getAdminData(
      url: SHOWFOLLOWING,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
      },
    ).then((value) {
      print(value.data);
      showFollowingModel = ShowFollowingModel.fromJson(value.data);
      users = value.data["following"];
      print(users);
      print(":::::::::::::::::::::::::::");
      if (!isClosed) emit(showFollowingSuccessState(showFollowingModel!));
    }).catchError(
      (error) {
        emit(showFollowingErrorState(error.toString()));
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
