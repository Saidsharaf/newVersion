import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/post/showCommentModel.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitComment/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ShowCommentCubit extends Cubit<ShowCommentStates> {
  ShowCommentCubit() : super(showCommentInitialState());

  List<dynamic> comments = [];

  ShowCommentModel? showCommentModel;

static ShowCommentCubit get(context) => BlocProvider.of(context);


  void showComment({@required int? id}) {
    emit(showCommentLoadingState());
    DioHelper.getAdminData(
      url: SHOWCOMMENT,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "posts_id": id
              },
    ).then((value) {
      print(value.data);
      showCommentModel = ShowCommentModel.fromJson(value.data);
      comments = value.data["comments"];
      print(comments);
      print(":::::::::::::::::::::::::::");
      print(comments[1]["comment"]);
      emit(showCommentSuccessState(showCommentModel!));
    }).catchError(
      (error) {
        emit(showCommentErrorState(error.toString()));
      },
    );
  }

}
