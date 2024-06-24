import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revive/models/appModel/post/addPost.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitAddPost/state.dart';
import 'package:revive/shared/component/constants.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/remote/dioHelper.dart';

class AddPostCubit extends Cubit<AddPostStates> {
  AddPostCubit() : super(addPostInitialState());

  AddPostModel? addPostModel;

  /// List<dynamic> users = [];

  void addPost({
    @required String? desc,
  }) async {
    if (image == null) {
      emit(addPostErrorState("No image selected"));
      return;
    }

    try {
      // Create a MultipartFile from the picked image
      MultipartFile multipartFile = await MultipartFile.fromFile(image!.path);

      emit(addPostLoadingState());

      // Prepare the data to be sent in the post request as FormData
      final formData = FormData.fromMap({
        "checksecurity": "EI8m2bl8TFVjbwYmuopsNPd1",
        "token":token,
        "file": multipartFile,
        "description": desc,
      });

      // Make the post request using DioHelper with formData
      final response = await DioHelper.post2Data(url: ADDPOST, data: formData);

      addPostModel = AddPostModel.fromJson(response.data);
      print(response.data);
      emit(addPostSuccessState(addPostModel!));
    } catch (error) {
      emit(addPostErrorState(error.toString()));
    }
  }

  final ImagePicker imagePicker = ImagePicker();
  XFile? image;

  void pickImage() async {
    try {
      image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image!.path.toString().isNotEmpty) {
        emit(addPostUploadState());
      }
    } catch (e) {}
  }

}
