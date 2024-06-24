import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/post/showMyPosts.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowMyPosts/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ShowMyPostsCubit extends Cubit<ShowMyPostsStates> {
  ShowMyPostsCubit() : super(showMyPostsInitialState());

  List<dynamic> users = [];
  ShowMyPostsModel? showMyPostsModel;

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
      emit(showMyPostsSuccessState(showMyPostsModel!));
    }).catchError(
      (error) {
        emit(showMyPostsErrorState(error.toString()));
      },
    );
  }
}
