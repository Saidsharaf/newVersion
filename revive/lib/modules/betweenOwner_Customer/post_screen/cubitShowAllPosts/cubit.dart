import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/post/showAllPostsModel.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitShowAllPosts/state.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ShowAllPostsCubit extends Cubit<ShowAllPostsStates> {
  ShowAllPostsCubit() : super(showAllPostsInitialState());

  List<dynamic> users = [];
  ShowAllPostsModel? showAllPostsModel;

  void showAllPosts() {
    emit(showAllPostsLoadingState());
    DioHelper.getAdminData(
      url: AllPOSTS,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcxMzkwNjkwNCwibmJmIjoxNzEzOTA2OTA0LCJqdGkiOiJteEpnaUkwNFR0MHQ5MnlPIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.oV-d902NQ3S7RjoeMn5OYaNoggZxCN0IFWQwcHVvMI0",
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
}
