

import 'package:revive/models/appModel/machine/Machine_model.dart';

abstract class MachineStates {}

class machineInitialState extends MachineStates {}

class machineLoadingState extends MachineStates {}

class machineSuccessState extends MachineStates {
  final MachineModel machineModel;

  machineSuccessState(this.machineModel);
}

class machineErrorState extends MachineStates {
  final String error;
  machineErrorState(this.error);
}
