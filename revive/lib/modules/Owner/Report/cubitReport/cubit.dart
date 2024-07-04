import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/reportFactory/ReportFactoryModel.dart';
import 'package:revive/modules/Owner/Report/cubitReport/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ReportFactoryCubit extends Cubit<ReportFactoryStates> {
  ReportFactoryCubit() : super(reportFactoryInitialState());

  ReportFactoryModel? reportFactoryModel;

  List<dynamic> output = [];
List<int> numbers = [];

  static ReportFactoryCubit get(context) => BlocProvider.of(context);

  void reportFactory({
    @required String? date,
  }) {
    emit(reportFactoryLoadingState());
    DioHelper.postData(
      url: REPORTFACTORY,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "machineids": 1,
        "date": "1a" // example ( 1a , 2024y , 3m ) all or year or num month
        // month = 3m # mening marth = 3m , April = 4m #  , year = 2024y || 2023y
        // all data  # 1a for return all carbonfootprint
      },
    ).then((value) {
      print(value.data);
      reportFactoryModel = ReportFactoryModel.fromJson(value.data);

      output = value.data["Python Output"];

      // List to store the extracted numbers
      
      // Iterate through each string in the list
      for (String item in output) {
        // Use regular expressions to check if the line matches the desired pattern
        RegExp regExp = RegExp(r'^\d+\s+(\d+)\s+\d{4}-\d{2}-\d{2}$');
        Match? match = regExp.firstMatch(item);

        // If the line matches, extract the number
        if (match != null) {
          int number = int.parse(match.group(1)!);
          numbers.add(number);
        }
      }

      // Output the extracted numbers
      print(numbers[5]);
      print(":::::::::::::::::::::::::::");
      emit(reportFactorySuccessState(reportFactoryModel!));
    }).catchError(
      (error) {
        emit(reportFactoryErrorState(error.toString()));
      },
    );
  }
}
