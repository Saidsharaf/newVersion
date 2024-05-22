import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/allUsers/alluser.dart';
import 'package:revive/models/appModel/adminModel/allUsers/states.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class AllUsersCubit extends Cubit<AllUsersStates> {
  AllUsersCubit() : super(allUsersInitialState());

  static AllUsersCubit get(context) => BlocProvider.of(context);
  AllUsersModel? allUsersModel;

  List<dynamic> users = [];
  void showALlUsers({
    @required String? type,
  }) {
    emit(allUsersLoadingState());
    print("loooooooading");
    DioHelper.postData(
      url: SHOWALLUSERS,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMjEyNC0yYTA5LWJhYzUtMzBiOS0xZWItMDAtMzEtOGIubmdyb2stZnJlZS5hcHAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcxMzU4NzIyOSwibmJmIjoxNzEzNTg3MjI5LCJqdGkiOiJ6M2tmYmtjMXptQWVuaG41Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Z-hu4esTGOtShtGKJ4Hbl2_7vUBLxw2JjJ79G2FP5_s",
        "type": type
      },
    ).then((value) {
      print(value.data);
      print("______________________________________");
      allUsersModel = AllUsersModel.fromJson(value.data);
      users = value.data["users"];
      print(users[1]["email"]);
      emit(allUsersSuccessState(allUsersModel!));
    }).catchError(
      (error) {
        print(error.toString());
        emit(allUsersErrorState(error.toString()));
      },
    );
  }

  String? msgRole;
  bool stat = true;
  void ModifyRole({
    @required int? id,
    @required int? role,
  }) {
    emit(allUsersLoadingState());
    print("loooooooading");
    DioHelper.PutData(
      url: MODIFYROLE,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcxMTY5NDA1OCwibmJmIjoxNzExNjk0MDU4LCJqdGkiOiJlbGRZbzRjVGRid09Cek41Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.RTDj6HW2CIdhL8e3i5Nxm1NKgq8gAEFwLjyYRmArPME",
        "id": id,
        "role": role,
      },
    ).then((value) {
      print(value.data);
      print("*********************");
      allUsersModel = AllUsersModel.fromJson(value.data);
      msgRole = value.data["msg"];
      stat = value.data["status"];
      print(value.data["msg"]);
      emit(allUsersSuccessState(allUsersModel!));
    }).catchError(
      (error) {
        print(error.toString());
        emit(allUsersErrorState(error.toString()));
      },
    );
  }

  void DeleteUsers({
    @required int? id,
  }) {
    emit(deletedUsersLoadingState());
    print("loooooooading");
    DioHelper.DeleteData(
      url: DELETEDATA,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwNjk5ODkxNSwibmJmIjoxNzA2OTk4OTE1LCJqdGkiOiJRWkp6azlSRnJXSERqN0dJIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.yGzlSZoxTCQY4TETLhUapP4xT_QBB6KLLuBlvsrlBaI",
        "id": id
      },
    ).then((value) {
      print(value.data);
      allUsersModel = AllUsersModel.fromJson(value.data);
      emit(deletedUsersSuccessState(allUsersModel!));
      showALlUsers(type: "CUSTOMER");
    }).catchError(
      (error) {
        print(error.toString());
        emit(deletedUsersErrorState(error.toString()));
      },
    );
  }

  void DeleteOwners({
    @required int? id,
  }) {
    emit(deletedUsersLoadingState());
    print("loooooooading");
    DioHelper.DeleteData(
      url: DELETEDATA,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwNjk5ODkxNSwibmJmIjoxNzA2OTk4OTE1LCJqdGkiOiJRWkp6azlSRnJXSERqN0dJIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.yGzlSZoxTCQY4TETLhUapP4xT_QBB6KLLuBlvsrlBaI",
        "id": id
      },
    ).then((value) {
      print(value.data);
      allUsersModel = AllUsersModel.fromJson(value.data);
      emit(deletedUsersSuccessState(allUsersModel!));
      showALlUsers(type: "OWNER");
    }).catchError(
      (error) {
        print(error.toString());
        emit(deletedUsersErrorState(error.toString()));
      },
    );
  }

  void DeleteAdmins({
    @required int? id,
  }) {
    emit(deletedUsersLoadingState());
    print("loooooooading");
    DioHelper.DeleteData(
      url: DELETEDATA,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwNjk5ODkxNSwibmJmIjoxNzA2OTk4OTE1LCJqdGkiOiJRWkp6azlSRnJXSERqN0dJIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.yGzlSZoxTCQY4TETLhUapP4xT_QBB6KLLuBlvsrlBaI",
        "id": id
      },
    ).then((value) {
      print(value.data);
      allUsersModel = AllUsersModel.fromJson(value.data);
      emit(deletedUsersSuccessState(allUsersModel!));
      showALlUsers(type: "ADMIN");
    }).catchError(
      (error) {
        print(error.toString());
        emit(deletedUsersErrorState(error.toString()));
      },
    );
  }

  int? indexNum;

  void changeIndexNumber(index) {
    indexNum = index;
    print(indexNum);
    emit(allUsersChangeIndexState());
  }

  String valueChosen = "1";
  void changeDropBtnUser(value) {
    valueChosen = value!;

    emit(allUsersChangeDropDownState());
    showALlUsers(type: "CUSTOMER");
    emit(allUsersChangeDoneState());
  }
  void changeDropBtnOwner(value) {
    valueChosen = value!;

    emit(allUsersChangeDropDownState());
    showALlUsers(type: "OWNER");
  }
}
