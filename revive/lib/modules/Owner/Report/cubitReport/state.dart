
import 'package:revive/models/appModel/adminModel/reportFactory/ReportFactoryModel.dart';

abstract class ReportFactoryStates {}
class reportFactoryInitialState extends ReportFactoryStates {}

class reportFactoryLoadingState extends ReportFactoryStates {}

class reportFactorySuccessState extends ReportFactoryStates {
  final ReportFactoryModel reportFactoryModel;
  reportFactorySuccessState(this.reportFactoryModel);
}

class reportFactoryErrorState extends ReportFactoryStates {
  final String error;
  reportFactoryErrorState(this.error);
}


