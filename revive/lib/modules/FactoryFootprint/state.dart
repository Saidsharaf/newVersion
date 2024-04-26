
import 'package:revive/models/appModel/CarbonModel/factory_model.dart';

abstract class CarbonFactoryStates {}

class carbonFactoryInitialState extends CarbonFactoryStates {}

class carbonFactoryLoadingState extends CarbonFactoryStates {}

class carbonFactoryChangeIndexState extends CarbonFactoryStates {}

class carbonFactorySuccessState extends CarbonFactoryStates {
  final CarbonFactoryModel carbonFactoryModel;

  carbonFactorySuccessState(this.carbonFactoryModel);
}

class carbonFactoryErrorState extends CarbonFactoryStates {
  final String error;
  carbonFactoryErrorState(this.error);
}



