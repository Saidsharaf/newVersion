// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubit/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubit/state.dart';
import 'package:revive/shared/component/component.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});

  var descController = TextEditingController();

  // var cubit = AddPostCubit.get(context);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostStates>(
        listener: (context, state) {
          if (state is addPostSuccessState) {
            if (state.addPostModel.status!) {
              navigateAndFinish(context, HomeLayout(index: 2));
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[100],
              title: Text(
                "Create post",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    if (descController.toString().isNotEmpty &&
                        context.read<AddPostCubit>().image != null) {
                      context
                          .read<AddPostCubit>()
                          .addPost(desc: descController.text);
                    } else {
                      showToast(
                          msg: "upload photo", state: toastStates.WARNING);
                    }
                  },
                  child: Text(
                    "Next   ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
              centerTitle: true,
            ),
            backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/prof1.jpeg"),
                    ),
                    isThreeLine: true,
                    title: Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Text(
                        "said sharaf",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          fontSize: 15,
                        ),
                      ),
                    ),
                    subtitle: TextFormField(
                      controller: descController,
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: "what is on your mind ?",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        context.read<AddPostCubit>().pickImage();
                        // print("$file ssssssssssssssss");
                      },
                      child: SvgPicture.asset(
                        'assets/icons/upload-image-svgrepo-com.svg',
                        height: 55,
                        width: 55,
                      ),
                    ),
                  ),

                  // file != null
                  //     ? Container(
                  //         padding: EdgeInsets.all(20), child: Image.file(file!))
                  //     :
                  BlocBuilder<AddPostCubit, AddPostStates>(
                    builder: (context, state) {
                      XFile? image = context.read<AddPostCubit>().image;
                      if (state is addPostUploadState) {
                        return Container(
                          child: Image.file(File(image!.path)),
                        );
                      } else {
                        Container();
                      }
                      return SizedBox();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
