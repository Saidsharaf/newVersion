import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/MachineOwner/MachineOwnerModel.dart';
import 'package:revive/models/appModel/barterModel/ShowPercentageModel.dart';
import 'package:revive/modules/Owner/machine_screen/cubitMachine/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class MachineOwnerCubit extends Cubit<MachineOwnerStates> {
  MachineOwnerCubit() : super(machineOwnerInitialState());

  MachineOwnerModel? machineOwnerModel;
  ShowPercentageModel? showPercentageModel;

  static MachineOwnerCubit get(context) => BlocProvider.of(context);

  List<dynamic> data = [];
  void machineOwner() {
    emit(machineOwnerLoadingState());
    DioHelper.getAdminData(
      url: MACHINEOWNER,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
      },
    ).then((value) {
      print(value.data);
      machineOwnerModel = MachineOwnerModel.fromJson(value.data);
      data = value.data["data"];
      print(":::::::::::::::::::::::::::");
      emit(machineOwnerSuccessState(machineOwnerModel!));
    }).catchError(
      (error) {
        emit(machineOwnerErrorState(error.toString()));
      },
    );
  }
}
