import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/login_model.dart';
import 'package:revive/modules/LoginAndReg/cubitForReg/state.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(registerInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  void userRegister({
    @required String? email,
    @required String? password,
    @required String? username,
    @required String? gender,
    @required String? birthday,
  }) {
    emit(registerLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
       // "name": "lona",
        "username": username,
        //"email": "lona@customer.rev",
        "password": password,
        //"gmail": email,
        // "phone": "4255759631",
        // "Personal_card": "3034567894125",
        "birthday": birthday,
        "gender": gender
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      // print(loginModel?.status);
      // print(loginModel?.message);
      // print(loginModel?.data!.token);
      emit(registerSuccessState(loginModel!));
    }).catchError(
      (error) {
        emit(registerErrorState(error.toString()));
      },
    );
  }

  bool ispassword = true;
  void changeShowPass() {
    ispassword = !ispassword;
    emit(registerChangeShowPassState());
  }
  String? selectedValue;
  void changeRadio(value) {
    selectedValue = value;
    emit(registerChangeShowPassState());
  }
String? theGender ;

}
