import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/post/fav/showFavModel.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitLikes/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class showLikesCubit extends Cubit<ShowLikesStates> {
  showLikesCubit() : super(showLikestInitialState());

  List<dynamic> fav = [];

  ShowFavModel? showFavModel;

static showLikesCubit get(context) => BlocProvider.of(context);


  void showLikes({@required int? id}) {
    emit(showLikestLoadingState());
    DioHelper.getAdminData(
      url: SHOWFAV,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "posts_id": id
              },
    ).then((value) {
      print(value.data);
      showFavModel = ShowFavModel.fromJson(value.data);
      fav = value.data["PersonFav"];
      print(fav);
      print(":::::::::::::::::::::::::::");
      emit(showLikestSuccessState(showFavModel!));
    }).catchError(
      (error) {
        emit(showLikestErrorState(error.toString()));
      },
    );
  }

}
