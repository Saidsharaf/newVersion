import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/allUsers/cubit.dart';
import 'package:revive/models/appModel/adminModel/allUsers/states.dart';
import 'package:revive/modules/Admin/AdminUsers/admin.dart';
import 'package:revive/modules/Admin/OwnerUsers/owner.dart';
import 'package:revive/modules/Admin/Users/user.dart';
import 'package:revive/modules/Admin/home_admin/homeAdmin.dart';
import 'package:revive/shared/component/component.dart';

class Audience extends StatelessWidget {
  const Audience({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllUsersCubit(),
      child: BlocConsumer<AllUsersCubit, AllUsersStates>(
        listener: (context, state) {
          if (state is allUsersSuccessState) {
            if (state.allUsersModel.status!) {
              if (state.allUsersModel.users![0].role == 3) {
                navigate(context, Users());
              } else if (state.allUsersModel.users![0].role == 1) {
                navigate(context, AdminUsers());
              }else if(state.allUsersModel.users![0].role == 2){
                navigate(context, OwnerUsers());
              }
            } else {
              print("noooooooooooooooooo");
            }
          } else {
            print("yeeeeeeeeeeeeeeeeees");
          }
        },
        builder: (context, state) {
          var cubit = AllUsersCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Audience"),
              centerTitle: true,
              leading: IconButton(
                        onPressed: () {
                          navigateAndFinish(context, HomeAdmin());
                        },
                        icon: Icon(Icons.arrow_back)),
            ),
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(100))),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 30,
                      children: [
                        itemDashboard(
                            title: 'Admins',
                            iconData: CupertinoIcons
                                .person_crop_circle_fill_badge_exclam,
                            background: Colors.deepOrange,
                            onPress: () {
                              cubit.showALlUsers(type: "ADMIN");
                            }),
                        itemDashboard(
                            title: 'Users',
                            iconData: CupertinoIcons.person_3,
                            background: Colors.green,
                            onPress: () {
                              cubit.showALlUsers(type: "CUSTOMER");
                            }),
                        itemDashboard(
                            title: 'Owners',
                            iconData:
                                CupertinoIcons.rectangle_stack_person_crop_fill,
                            background: Colors.purple,
                            onPress: () {
                              cubit.showALlUsers(type: "OWNER");
                            }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          );
        },
      ),
    );
  }

  itemDashboard(
          {String? title,
          IconData? iconData,
          Color? background,
          Function()? onPress}) =>
      GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.green.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: Colors.white)),
              const SizedBox(height: 8),
              Text(
                title!.toUpperCase(),
                // style: ,
              ),
            ],
          ),
        ),
      );
}
