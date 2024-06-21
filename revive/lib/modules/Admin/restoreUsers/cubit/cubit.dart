import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/restoreUsers/restore.dart';
import 'package:revive/models/appModel/adminModel/restoreUsers/showRestore.dart';
import 'package:revive/modules/Admin/restoreUsers/cubit/state.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class RestoreCubit extends Cubit<RestoreStates> {
  RestoreCubit() : super(showRestoreInitialState());

  static RestoreCubit get(context) => BlocProvider.of(context);
  ShowRestoreModel? showrestoreModel;
  RestoreModel? restoreModel;
  List<dynamic> users = [];
  void userShowRestore() {
    emit(showRestoreLoadingState());
    DioHelper.getAdminData(url: SHOWRESTOREUSERS, data: {
      "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
      "token":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwNjk5ODkxNSwibmJmIjoxNzA2OTk4OTE1LCJqdGkiOiJRWkp6azlSRnJXSERqN0dJIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.yGzlSZoxTCQY4TETLhUapP4xT_QBB6KLLuBlvsrlBaI"
    }).then((value) {
      print(value.data);
      showrestoreModel = ShowRestoreModel.fromJson(value.data);
      users = value.data["users"];
      emit(showRestoreSuccessState(showrestoreModel!));
    }).catchError(
      (error) {
        emit(showRestoreErrorState(error.toString()));
      },
    );
  }

  void userRestore({
    @required int? id ,
  }) {
    emit(restoreLoadingState());
    DioHelper.postData(
      url: RESTOREUSERS,
      data: {
      "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
      "token":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwNjk5ODkxNSwibmJmIjoxNzA2OTk4OTE1LCJqdGkiOiJRWkp6azlSRnJXSERqN0dJIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.yGzlSZoxTCQY4TETLhUapP4xT_QBB6KLLuBlvsrlBaI",
      "id": id
    }).then((value) {
      print(value.data);
      restoreModel = RestoreModel.fromJson(value.data);
      users = value.data["users"];
      emit(restoreSuccessState(restoreModel!));
    }).catchError(
      (error) {
        emit(restoreErrorState(error.toString()));
      },
    );
  }
}
