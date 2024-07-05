import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/chatModel/ChatModel.dart';
import 'package:revive/models/appModel/adminModel/reportFactory/ReportFactoryModel.dart';
import 'package:revive/modules/Owner/Report/cubitReport/state.dart';
import 'package:revive/modules/chatScreen/cubitReport/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(chatInitialState());

  ChatModel? chatModel;

  List<dynamic> chatList = [];

  static ChatCubit get(context) => BlocProvider.of(context);

  void chatRevive({String? question}) {
    emit(chatLoadingState());
    DioHelper.postData(
      url: CHAT,
      data: {
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token": token,
        "question":question
      },
    ).then((value) {
      print(value.data);
      chatModel = ChatModel.fromJson(value.data);
      chatList=value.data["Python Output"];
      print(":::::::::::::::::::::::::::");
      emit(chatSuccessState(chatModel!));
    }).catchError(
      (error) {
        emit(chatErrorState(error.toString()));
      },
    );
  }
}
