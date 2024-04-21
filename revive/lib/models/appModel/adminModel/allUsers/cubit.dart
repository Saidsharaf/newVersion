import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/allUsers/alluser.dart';
import 'package:revive/models/appModel/adminModel/allUsers/states.dart';
import 'package:revive/models/appModel/adminModel/users/show_users.dart';
import 'package:revive/models/appModel/adminModel/users/states.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class AllUsersCubit extends Cubit<AllUsersStates> {
  AllUsersCubit() : super(allUsersInitialState());

  static AllUsersCubit get(context) => BlocProvider.of(context);
  AllUsersModel? allUsersModel;

  
  void showALlUsers({
    int? id,
  }) {
    emit(allUsersLoadingState());
    print("loooooooading");
    DioHelper.postData(
      url: SHOWALLUSERS,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMjEyNC0yYTA5LWJhYzUtMzBiOS0xZWItMDAtMzEtOGIubmdyb2stZnJlZS5hcHAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcxMzU4NzIyOSwibmJmIjoxNzEzNTg3MjI5LCJqdGkiOiJ6M2tmYmtjMXptQWVuaG41Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Z-hu4esTGOtShtGKJ4Hbl2_7vUBLxw2JjJ79G2FP5_s",
        "id": "5"
      },
    ).then((value) {
      print(value.data);
      allUsersModel = AllUsersModel.fromJson(value.data);
      
      emit(allUsersSuccessState(allUsersModel!));
    }).catchError(
      (error) {
        print(error.toString());
        emit(allUsersErrorState(error.toString()));
      },
    );
  }
}
