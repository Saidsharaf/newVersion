import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/forgetPassModel/code.dart';
import 'package:revive/models/appModel/forgetPassModel/forget.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/cubitForget/state.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ForgetCubit extends Cubit<ForgetStates> {
  ForgetCubit() : super(forgetInitialState());

  static ForgetCubit get(context) => BlocProvider.of(context);
  ForgetModel? forgetModel;
  CodeModel? codeModel;

  void userForget({
    @required String? gmail,
  }) {
    emit(forgetLoadingState());
    DioHelper.getAdminData(url: SENDEMAIL, data: {
      "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
      "gmail": gmail,
    }).then((value) {
      print(value.data);
      forgetModel = ForgetModel.fromJson(value.data);
      emit(forgetSuccessState(forgetModel!));
    }).catchError(
      (error) {
        emit(forgetErrorState(error.toString()));
      },
    );
  }


}
