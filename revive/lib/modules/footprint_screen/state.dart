
import 'package:revive/models/appModel/CarbonModel/person_model.dart';

abstract class CarbonPersonStates {}

class carbonPersonInitialState extends CarbonPersonStates {}

class carbonPersonLoadingState extends CarbonPersonStates {}

class carbonPersonChangeIndexState extends CarbonPersonStates {}

class carbonPersonSuccessState extends CarbonPersonStates {
  final CarbonPersonModel carbonPersonModel;

  carbonPersonSuccessState(this.carbonPersonModel);
}

class carbonPersonErrorState extends CarbonPersonStates {
  final String error;
  carbonPersonErrorState(this.error);
}



