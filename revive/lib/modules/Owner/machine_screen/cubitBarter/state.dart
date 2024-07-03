import 'package:revive/models/appModel/barterModel/AddBarterModel.dart';
import 'package:revive/models/appModel/barterModel/ShowPercentageModel.dart';

abstract class BarterStates {}
class addBarterInitialState extends BarterStates {}

class addBarterLoadingState extends BarterStates {}

class addBarterSuccessState extends BarterStates {
  final AddBarterModel addBarterModel;
  addBarterSuccessState(this.addBarterModel);
}

class addBarterErrorState extends BarterStates {
  final String error;
  addBarterErrorState(this.error);
}


class showPercentageLoadingState extends BarterStates {}

class showPercentageSuccessState extends BarterStates {
  final ShowPercentageModel showPercentageModel;
  showPercentageSuccessState(this.showPercentageModel);
}

class showPercentageErrorState extends BarterStates {
  final String error;
  showPercentageErrorState(this.error);
}
