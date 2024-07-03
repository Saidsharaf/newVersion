import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/barterModel/AddBarterModel.dart';
import 'package:revive/models/appModel/barterModel/ShowPercentageModel.dart';
import 'package:revive/modules/Owner/machine_screen/cubitBarter/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class BarterCubit extends Cubit<BarterStates> {
  BarterCubit() : super(addBarterInitialState());

  AddBarterModel? addBarterModel;
  ShowPercentageModel? showPercentageModel;

  static BarterCubit get(context) => BlocProvider.of(context);

  void addBarter({
    @required String? nameSeller,
    @required String? nameBuyer,
    @required int? carbonFootprint,
    @required int? expire,
  }) {
    emit(addBarterLoadingState());
    DioHelper.postData(
      url: ADDBARTER,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "Nmachine_Seller": "revive", // capital || small | mix //
        "Nmachine_Buyer": nameBuyer, // capital || small | mix //
        "carbon_footprint": carbonFootprint,
        "expire": expire,
        "time": "MoNth" // capital || small | mix //
      },
    ).then((value) {
      print(value.data);
      addBarterModel = AddBarterModel.fromJson(value.data);
      print(":::::::::::::::::::::::::::");
      emit(addBarterSuccessState(addBarterModel!));
    }).catchError(
      (error) {
        emit(addBarterErrorState(error.toString()));
      },
    );
  }


  void showPercentage({
    @required int? id,
  }) {
    emit(showPercentageLoadingState());
    DioHelper.getAdminData(
      url: SHOWPERCENTAGE,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Jldi91c2Vycy9sb2dpbiIsImlhdCI6MTcwOTgyNzUxMywibmJmIjoxNzA5ODI3NTEzLCJqdGkiOiJOeGc4ekhzQnpCRUY5aFlXIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.sg2C-6dueKpTpVwAGcRRbPktkg4uq4AtZhoTQh5qtHo",
        "machineid":id
      },
    ).then((value) {
      print(value.data);
      showPercentageModel = ShowPercentageModel.fromJson(value.data);
      print(":::::::::::::::::::::::::::");
      emit(showPercentageSuccessState(showPercentageModel!));
    }).catchError(
      (error) {
        emit(showPercentageErrorState(error.toString()));
      },
    );
  }
}
