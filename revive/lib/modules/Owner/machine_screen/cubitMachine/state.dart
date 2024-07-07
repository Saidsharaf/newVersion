
import 'package:revive/models/appModel/MachineOwner/MachineOwnerModel.dart';

abstract class MachineOwnerStates {}
class machineOwnerInitialState extends MachineOwnerStates {}

class machineOwnerLoadingState extends MachineOwnerStates {}

class machineOwnerSuccessState extends MachineOwnerStates {
  final MachineOwnerModel machineOwnerModel;
  machineOwnerSuccessState(this.machineOwnerModel);
}

class machineOwnerErrorState extends MachineOwnerStates {
  final String error;
  machineOwnerErrorState(this.error);
}
