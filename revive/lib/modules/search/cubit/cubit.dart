import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/post/follow/AddFollowModel.dart';
import 'package:revive/models/appModel/post/search/searchModel.dart';
import 'package:revive/modules/search/cubit/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(searchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;
  AddFollowModel? addFollowModel;
  List<dynamic> users = [];

  void showSearch({
    @required String? query,
  }) {
    emit(searchLoadingState());
    users = [];
    DioHelper.getAdminData(
      url: SEARCH,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "query": query
      },
    ).then((value) {
      print(value.data);
      searchModel = SearchModel.fromJson(value.data);
      users = value.data["users"];
      print(users);
      print(":::::::::::::::::::::::::::");
      if (!isClosed) emit(searchSuccessState(searchModel!));
    }).catchError(
      (error) {
        emit(searchErrorState(error.toString()));
      },
    );
  }

  void addFollow({
    @required int? followingID,
  }) {
    emit(addFollowLoadingState());
    users = [];
    DioHelper.postData(
      url: ADDFOLLOW,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "following_id": followingID
      },
    ).then((value) {
      print(value.data);
      addFollowModel = AddFollowModel.fromJson(value.data);
      users = value.data["users"];
      print(users);
      print(":::::::::::::::::::::::::::");
      if (!isClosed) emit(addFollowSuccessState(addFollowModel!));
    }).catchError(
      (error) {
        emit(addFollowErrorState(error.toString()));
      },
    );
  }
}
