import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:revive/models/appModel/post/addPost.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubit/state.dart';
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

  // void pickPhoto({File? file, context}) async {
  //   var picked =
  //       // ignore: deprecated_member_use
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (picked != null) {
  //     file = File(picked.path);

  //     emit(addPostUploadState());

  //     var rand = Random().nextInt(100000);
  //     var imageName = "${rand}" + basename(picked.path);
  //     print(imageName.toString());
  //   }
  // }

//   File? file;
//   showBottomSheet({context}) {
//     emit(addPostbottCamState());
//     return showModalBottomSheet(
//         context: context,
//         builder: (Context) {
//           return Container(
//             padding: const EdgeInsets.all(20),
//             height: 200,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "please choose image ",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     var picked =
//                         // ignore: deprecated_member_use
//                         await ImagePicker()
//                             .pickImage(source: ImageSource.gallery);
//                     if (picked != null) {
//                       file = File(picked.path);
//                       print("$file mmmmmmmmmmmmm");
//                       emit(addPostUploadState());
//                       var rand = Random().nextInt(100000);
//                       var imageName = "${rand}" + basename(picked.path);
//                       print(imageName.toString());
//                       Navigator.of(context).pop();
//                     }
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(10),
//                     child: Row(children: const [
//                       Icon(
//                         Icons.photo_outlined,
//                         size: 30,
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Text(
//                         "From Gallery",
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ]),
//                   ),
//                 ),
// //______________________________________________________________________________
//                 InkWell(
//                   onTap: () async {
//                     var picked =
//                         // ignore: deprecated_member_use
//                         await ImagePicker()
//                             .pickImage(source: ImageSource.camera);
//                     if (picked != null) {
//                       //  setState(() {
//                       file = File(picked.path);
//                       //  });
//                       emit(addPostUploadCamState());

//                       var rand = Random().nextInt(100000);
//                       var imageName = "${rand}" + basename(picked.path);

//                       debugPrint(imageName.toString());
//                       Navigator.of(context).pop();
//                     }
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(10),
//                     child: Row(children: const [
//                       Icon(
//                         Icons.camera,
//                         size: 30,
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Text(
//                         "From Camera",
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ]),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
}
