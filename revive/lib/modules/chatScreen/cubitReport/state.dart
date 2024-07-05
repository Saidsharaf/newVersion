

import 'package:revive/models/appModel/adminModel/chatModel/ChatModel.dart';

abstract class ChatStates {}
class chatInitialState extends ChatStates {}

class chatLoadingState extends ChatStates {}

class chatSuccessState extends ChatStates {
  final ChatModel chatModel;
  chatSuccessState(this.chatModel);
}

class chatErrorState extends ChatStates {
  final String error;
  chatErrorState(this.error);
}


