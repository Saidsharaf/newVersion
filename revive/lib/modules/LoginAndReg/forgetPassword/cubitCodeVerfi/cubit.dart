import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/forgetPassModel/code.dart';
import 'package:revive/models/appModel/forgetPassModel/newPass.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/cubitCodeVerfi/state.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class CodeCubit extends Cubit<CodeStates> {
  CodeCubit() : super(codeInitialState());

  static CodeCubit get(context) => BlocProvider.of(context);
  CodeModel? codeModel;
  NewPassModel? newPassModel;

  void userCode({
    @required int? code,
  }) {
    emit(codeLoadingState());
    DioHelper.postData(
            url: CHECKCODE,
            data: {"checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1", "code": code})
        .then((value) {
      print(value.data);
      codeModel = CodeModel.fromJson(value.data);
      emit(codeSuccessState(codeModel!));
      print(codeModel!.msg);
    }).catchError(
      (error) {
        emit(codeErrorState(error.toString()));
      },
    );
  }

  void userNewPass({
    @required String? gmail,
    @required String? password,
  }) {
    emit(newPassLoadingState());
    DioHelper.postData(
      url: NEWPASS,
      data: {
      "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
      "gmail": gmail,
      "password": password
    }).then((value) {
      print(value.data);
      newPassModel = NewPassModel.fromJson(value.data);
      emit(newPassSuccessState(newPassModel!));
      print(codeModel!.msg);
    }).catchError(
      (error) {
        emit(newPassErrorState(error.toString()));
      },
    );
  }
}
