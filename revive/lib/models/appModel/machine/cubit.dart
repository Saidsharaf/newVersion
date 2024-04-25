import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/machine/Machine_model.dart';
import 'package:revive/models/appModel/machine/states.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class MachineCubit extends Cubit<MachineStates> {
  MachineCubit() : super(machineInitialState());

  static MachineCubit get(context) => BlocProvider.of(context);
  MachineModel? machineModel;

  void addMachine({
    @required String? name,
    @required String? location,
    @required String? type,
    @required int? id,

  }) {
    emit(machineLoadingState());
    print("loooooooading");
    DioHelper.postData(
      url: SHOWALLUSERS,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "auth_token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcxMDI1NzQ2NSwibmJmIjoxNzEwMjU3NDY1LCJqdGkiOiJDY0FoRlptSlB5bzFWSVhEIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.xApZxF7F02Bg_WRs03G3C4n6HOVYykhU_whFtL1YbRc",
        "name":  name,
        "owner_id": id,
        "location": location,
        "type": type
      },
    ).then((value) {
      print(value.data);
      machineModel = MachineModel.fromJson(value.data);

      emit(machineSuccessState(machineModel!));
    }).catchError(
      (error) {
        print(error.toString());
        emit(machineErrorState(error.toString()));
      },
    );
  }
}
