import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/showTourism/showTourismModel.dart';
import 'package:revive/modules/Owner/tourism_screen/cubit/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class TourismCubit extends Cubit<TourismStates> {
  TourismCubit() : super(tourismInitialState());

  ShowTourismModel? showTourismModel;

  static TourismCubit get(context) => BlocProvider.of(context);

  List<dynamic> data = [];
  void showTourism() {
    emit(tourismLoadingState());
    DioHelper.getAdminData(
      url: SHOWTOURISM,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "machineid":1,
      },
    ).then((value) {
      print(value.data);
      showTourismModel = ShowTourismModel.fromJson(value.data);
      data = value.data["data"];
      print(":::::::::::::::::::::::::::");
      emit(tourismSuccessState(showTourismModel!));
    }).catchError(
      (error) {
        emit(tourismErrorState(error.toString()));
      },
    );
  }
}
