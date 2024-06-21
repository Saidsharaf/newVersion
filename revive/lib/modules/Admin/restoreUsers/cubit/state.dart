import 'package:revive/models/appModel/adminModel/restoreUsers/restore.dart';
import 'package:revive/models/appModel/adminModel/restoreUsers/showRestore.dart';

abstract class RestoreStates {}
class showRestoreInitialState extends RestoreStates {}

class showRestoreLoadingState extends RestoreStates {}

class showRestoreSuccessState extends RestoreStates {
  final ShowRestoreModel showRestoreModel;
  showRestoreSuccessState(this.showRestoreModel);
}

class showRestoreErrorState extends RestoreStates {
  final String error;
  showRestoreErrorState(this.error);
}
class restoreLoadingState extends RestoreStates {}

class restoreSuccessState extends RestoreStates {
  final RestoreModel restoreModel;
  restoreSuccessState(this.restoreModel);
}

class restoreErrorState extends RestoreStates {
  final String error;
  restoreErrorState(this.error);
}
