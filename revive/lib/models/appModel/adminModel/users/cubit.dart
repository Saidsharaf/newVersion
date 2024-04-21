import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/users/show_users.dart';
import 'package:revive/models/appModel/adminModel/users/states.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ShowUserCubit extends Cubit<ShowUserStates> {
  ShowUserCubit() : super(showUserInitialState());

  static ShowUserCubit get(context) => BlocProvider.of(context);
  ShowUserModel? showUserModel;

  void showUser({
    int? id,
  }) {
    emit(showUserLoadingState());
    print("loooooooading");
    DioHelper.getAdminData(
      url: SHOWUSER,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMjEyNC0yYTA5LWJhYzUtMzBiOS0xZWItMDAtMzEtOGIubmdyb2stZnJlZS5hcHAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcxMzU4NzIyOSwibmJmIjoxNzEzNTg3MjI5LCJqdGkiOiJ6M2tmYmtjMXptQWVuaG41Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Z-hu4esTGOtShtGKJ4Hbl2_7vUBLxw2JjJ79G2FP5_s",
        "id": "5"
      },
    ).then((value) {
      print(value.data);
      showUserModel = ShowUserModel.fromJson(value.data);
      // print(showUserModel?.status);
      // print(showUserModel?.message);
      // print(showUserModel?.data!.token);
      emit(showUserSuccessState(showUserModel!));
    }).catchError(
      (error) {
        print(error.toString());
        emit(showUserErrorState(error.toString()));
      },
    );
  }
  
}
