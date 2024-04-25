import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/adminModel/allUsers/cubit.dart';
import 'package:revive/models/appModel/adminModel/allUsers/states.dart';
import 'package:revive/modules/Admin/home_admin/audience.dart';
import 'package:revive/modules/LoginAndReg/login.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllUsersCubit(),
      child: BlocConsumer<AllUsersCubit, AllUsersStates>(
        listener: (context, state) {
          // if (state is allUsersSuccessState) {
          //   if (state.allUsersModel.status!) {
          //     sharedPref
          //         .saveData(
          //             key: "fName", value: state.allUsersModel.users![0].name)
          //         .then((value) {
          //       navigate(context, Users());
          //     });
          //   } else {
          //     print("noooooooooooooooooo");
          //   }
          // } else {
          //   print("yeeeeeeeeeeeeeeeeees");
          // }
        },
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 30),
                          title: Text(
                              'Hello, ' + sharedPref.getData(key: "AdminName"),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              )),
                          subtitle: Text(sharedPref.getData(key: "AdminEmail"),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.white54)),
                          trailing: const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/admin.png'),
                          ),
                        ),
                        const SizedBox(height: 30)
                      ],
                    ),
                  ),
                ),
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
                            title: 'Restore',
                            iconData: CupertinoIcons.restart,
                            background: Colors.deepOrange,
                            onPress: () {}),
                        itemDashboard(
                            title: 'Analytics',
                            iconData: CupertinoIcons.graph_circle,
                            background: Colors.green,
                            onPress: () {}),
                        itemDashboard(
                            title: 'Audience',
                            iconData: CupertinoIcons.person_2,
                            background: Colors.purple,
                            onPress: () {
                              navigate(context, Audience());
                            }),
                        itemDashboard(
                            title: 'Comments',
                            iconData: CupertinoIcons.chat_bubble_2,
                            background: Colors.brown,
                            onPress: () {}),
                        itemDashboard(
                          title: 'Machine',
                          iconData: Icons.factory_outlined,
                          background: Colors.indigo,
                          onPress: () {
                            
                          },
                        ),
                        itemDashboard(
                            title: 'Upload',
                            iconData: CupertinoIcons.add_circled,
                            background: Colors.teal,
                            onPress: () {}),
                        itemDashboard(
                            title: 'About',
                            iconData: CupertinoIcons.question_circle,
                            background: Colors.blue,
                            onPress: () {}),
                        itemDashboard(
                            title: 'Logout',
                            iconData: CupertinoIcons.arrowshape_turn_up_left,
                            background: Colors.pinkAccent,
                            onPress: () {
                              sharedPref.removeData(key: "token").then((value) {
                                if (value) {
                                  navigateAndFinish(context, loginScreen());
                                }
                              });
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
