

import 'package:revive/models/appModel/showTourism/showTourismModel.dart';

abstract class TourismStates {}
class tourismInitialState extends TourismStates {}

class tourismLoadingState extends TourismStates {}

class tourismSuccessState extends TourismStates {
  final ShowTourismModel showTourismModel;
  tourismSuccessState(this.showTourismModel);
}

class tourismErrorState extends TourismStates {
  final String error;
  tourismErrorState(this.error);
}
